#set page(paper: "a5")

= Capítulo 1 - Introducción
== Sistemas centralizados, descentralizados y distribuidos
=== Califique y justifique los siguientes sistemas bajo estos conceptos en centralizados, descentralizados y distribuidos

Gmail
- Centralizado (gestionado por google)
- Distribuido (en muchos svrs)


Spotify / Netflix
- Centralizado (hay solo una fuente de verdad)
- Distribuido (en muchos svrs)


NAS
- Centralizado

Home Assistant
- Centralizado (el home assitant es el cerebro)
– Distribuido (los otros componentes lo hacen distribuido)

IA en datacenter
- Centralizado (Una única organización lo administra)
– Distribuido (El uso de GPUs y entrenamiento)

Un cluster de virtualización de computadoras
- Centralizado (Gestionado por un OS)
– Distribuido (Muchos Compus)

Tótem en parque
- Centralizado (es un totem unico con un centro de verdad)

=== Elija un sistema de su preferencia: Descríbalo, clasifíquelo y justifique.

*Descripción:* Gmail es un servicio de correo electrónico provisto por Google. Permite a los usuarios enviar y recibir correos mediante protocolos estándar como SMTP, IMAP y POP, además de ofrecer funcionalidades adicionales como filtrado de spam, búsqueda y almacenamiento en la nube.

*Clasificación:* Centralizado – distribuido.

*Justificación:* La gestión de usuarios, autenticación, filtrado y control del servicio son centralizados bajo la administración de Google (una única autoridad). Sin embargo, para garantizar disponibilidad y escalabilidad global, Gmail se ejecuta en múltiples servidores distribuidos en datacenters a lo largo del mundo, lo que lo convierte también en un sistema distribuido a nivel de infraestructura.

=== Elija un sistema centralizado pero distribuído y justifique su respuesta

*Descripción:* Spotify es un servicio de streaming de música bajo demanda. Los usuarios acceden al catálogo a través de internet desde múltiples dispositivos.

*Clasificación:* Centralizado – distribuido.

*Justificación:* El control del servicio, el catálogo y los algoritmos de recomendación están bajo una autoridad central (Spotify). Sin embargo, la entrega del contenido está soportada por una infraestructura distribuida a través de CDNs y servidores en diferentes regiones, lo que permite alta disponibilidad y baja latencia.

=== Elija un sistema descentralizado y justifique su respuesta

*Descripción:* Mastodon es una red social de microblogging de software libre que funciona bajo el protocolo ActivityPub. Los usuarios se registran en instancias independientes (servidores) y pueden interactuar con usuarios de otras instancias gracias a la federación.

*Clasificación:* Descentralizado.

*Justificación:*

- Cada instancia de Mastodon es autónoma: administra a sus usuarios, sus reglas, su almacenamiento y su moderación.

- No existe una autoridad central que controle toda la red; las instancias se comunican entre sí mediante protocolos abiertos (federación).

- La “verdad” de los datos de cada usuario está en el servidor donde se registró, pero puede intercambiar información con otros servidores para permitir interacciones sociales entre comunidades distintas.

- Esto implica que si una instancia cae o se desconecta, el resto de la red sigue funcionando (no hay un único punto de fallo global).

=== Dado un server plex corriendo en una raspberry donde tengo todos los videos familiares en el mismo disco. ¿Cuándo pasaría a ser un sistema distribuido y por qué?

Plex pasa a ser distribuido cuando la responsabilidad de almacenamiento y/o entrega de los videos no está en un solo servidor, sino en varios nodos que cooperan para brindar el servicio.
