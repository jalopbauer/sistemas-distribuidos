import os
import datetime as dt
from concurrent import futures

import grpc
import requests

import sys
sys.path.append(os.path.join(os.path.dirname(__file__), ".."))

from protos import weatherapp_pb2, weatherapp_pb2_grpc

OPEN_METEO_URL = "https://api.open-meteo.com/v1/forecast"

class WeatherServicer(weatherapp_pb2_grpc.WeatherServicer):
    def GetWeather(self, request, context):
        lat = request.latitude
        lon = request.longitude
        if lat == 0.0 and lon == 0.0:
            return weatherapp_pb2.WeatherResponse(error="Latitude/Longitude required")

        try:
            params = {
                "latitude": lat,
                "longitude": lon,
                "current": "temperature_2m",
                "timezone": "auto"
            }
            resp = requests.get(OPEN_METEO_URL, params=params, timeout=7)
            j = resp.json()
            current = j.get("current", {})
            value = current.get("temperature_2m", None)
            time_iso = current.get("time", "")
            if value is None:
                return weatherapp_pb2.WeatherResponse(error="Open-Meteo returned no current temperature")
            info = weatherapp_pb2.WeatherInfo(
                temperature_c=float(value),
                unit="C",
                source="open-meteo",
                time_iso=time_iso
            )
            return weatherapp_pb2.WeatherResponse(weather=info)
        except Exception as e:
            return weatherapp_pb2.WeatherResponse(error=f"Exception contacting open-meteo: {e}")

def serve():
    port = os.environ.get("WEATHER_SERVICE_PORT", "50052")
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    weatherapp_pb2_grpc.add_WeatherServicer_to_server(WeatherServicer(), server)
    server.add_insecure_port(f"[::]:{port}")
    server.start()
    print(f"Weather service listening on {port}", flush=True)
    server.wait_for_termination()

if __name__ == "__main__":
    serve()