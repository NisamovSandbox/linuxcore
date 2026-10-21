# Protocolo DHCP (Dynamic Host Configuration Protocol)

## Teoría general

El protocolo **DHCP** opera en la capa de aplicación y funciona bajo una arquitectura cliente-servidor (utilizando los puertos UDP 67 y 68). Su función principal es **automatizar y gestionar la asignación de direcciones IP** y otros parámetros de red (como la máscara de subred, la puerta de enlace predeterminada y los servidores DNS) a los dispositivos que se conectan a una red.

Sin DHCP, los administradores de red tendrían que configurar manualmente cada dispositivo (IP estática), lo cual es ineficiente y muy propenso a errores (como asignar la misma IP a dos equipos distintos).

### Conceptos clave

- **Ámbito (Scope):** Es el rango o conjunto de direcciones IP consecutivas que el servidor DHCP tiene permitido asignar. Por ejemplo, de la `192.168.1.100` a la `192.168.1.200`.
- **Tiempo de concesión (Lease Time):** Las direcciones IP **no se regalan, se alquilan**. El servidor asigna la IP por un tiempo determinado (por ejemplo, 8 horas o 7 días). Cuando transcurre la mitad de ese tiempo, el cliente intenta renovar el alquiler. Si el dispositivo se desconecta y el tiempo expira, la IP vuelve al grupo (pool) para ser asignada a otro equipo.
- **Reserva (Reservation):** Es una regla en el servidor DHCP que vincula una dirección IP específica a la dirección física (MAC Address) de un dispositivo. Garantiza que dispositivos críticos (como una impresora de red o un servidor local) siempre reciban la misma IP dinámicamente, simulando una IP estática sin necesidad de configurarla a mano en el equipo.

## Proceso DORA (ciclo de vida de la asignación)

Cuando un dispositivo (cliente) se conecta a una red y está configurado para obtener una IP automáticamente, se inicia una negociación con el servidor DHCP conocida por su acrónimo **DORA**: Discover, Offer, Request, Acknowledge.

### DHCP Discover (Descubrimiento)

El cliente final se conecta a la red sin una dirección IP asignada y no sabe quién es el servidor DHCP. Para localizar un servidor disponible, transmite una solicitud en modo difusión (broadcast), como diciendo: *"Soy nuevo aquí, ¿hay algún servidor DHCP que me pueda dar una IP?"*.

- Dirección IP Origen: 0.0.0.0
- Dirección IP Destino: 255.255.255.255
- Puerto Origen: 68
- Puerto Destino: 67

Descripción técnica: El cliente envía un paquete DHCPDISCOVER a toda la subred física. Incluye su dirección MAC física en el campo chaddr (Client Hardware Address) para que el servidor pueda identificarlo.

### DHCP Offer (Oferta)

Uno o varios servidores DHCP reciben el mensaje DHCPDISCOVER. Cada servidor reserva una dirección IP no asignada de su grupo de direcciones (pool) y envía una propuesta al cliente, como diciendo: *"Tengo esta dirección IP disponible para ti, junto con la máscara y el router"*.

- Dirección IP Origen: IP del servidor DHCP (ej. 192.168.1.1)
- Dirección IP Destino: 255.255.255.255 (o unicast a la IP ofrecida/MAC según la implementación)
- Puerto Origen: 67
- Puerto Destino: 68

Descripción técnica: El servidor responde con un paquete DHCPOFFER que contiene la dirección IP propuesta (yiaddr - Your IP Address), la máscara de subred, el tiempo de concesión (Lease Time), la puerta de enlace predeterminada y los servidores DNS.

### DHCP Request (Solicitud)

El cliente evalúa las ofertas recibidas (generalmente acepta la primera que llega) y notifica formalmente al servidor seleccionado que acepta la dirección propuesta, informando implícitamente a los demás servidores que declina sus ofertas. Es como decir: *"Acepto la oferta del Servidor X. Por favor, resérvame esa IP"*.

- Dirección IP Origen: 0.0.0.0
- Dirección IP Destino: 255.255.255.255
- Puerto Origen: 68
- Puerto Destino: 67

Descripción técnica: El cliente emite un mensaje DHCPREQUEST en broadcast. Incluye la opción Server Identifier para especificar cuál servidor fue elegido. El uso de broadcast permite que los demás servidores liberen las direcciones que habían reservado en sus ofertas.

### DHCP Acknowledgment (Reconocimiento)

El servidor seleccionado registra la IP como "ocupada" en su base de datos, confirma el contrato de arrendamiento de la IP (Lease) y finaliza el proceso de configuración: *"Confirmado. La IP es tuya. Aquí tienes el resto de la configuración y el tiempo de concesión"*.

- Dirección IP Origen: IP del servidor DHCP
- Dirección IP Destino: 255.255.255.255 (o unicast)
- Puerto Origen: 67
- Puerto Destino: 68

Descripción técnica: El servidor envía un paquete DHCPACK ratificando la asignación de la IP y los parámetros de red adicionales. Una vez que el cliente recibe este paquete, vincula la IP a su interfaz de red y puede iniciar comunicaciones en la red IP. Si la IP ya no está disponible, el servidor responderá con un DHCPNAK (Negative Acknowledgment) y el proceso reiniciará desde el paso Discover.

## Proceso de renovación (Lease Renewal)

El tiempo de concesión (Lease Time) determina la validez de la asignación. El cliente busca renovar la dirección mediante el envío de mensajes DHCPREQUEST dirigidos por unicast directamente a su servidor:

- **T1 (50% del tiempo de concesión):** El cliente envía un DHCPREQUEST por unicast. Si el servidor responde con DHCPACK, el temporizador se reinicia.
- **T2 (87.5% del tiempo de concesión):** Si el servidor no respondió en T1, el cliente transmite un DHCPREQUEST por broadcast a cualquier servidor DHCP disponible.
- **Expiración (100%):** Si la concesión vence sin renovación, el cliente debe liberar la IP (DHCPRELEASE) y reiniciar el proceso completo DORA.

# DHCP Failover

El **DHCP Failover** es una configuración que permite que dos servidores DHCP trabajen de manera coordinada para asignar direcciones IP a los clientes de una red. Su objetivo principal es garantizar la **alta disponibilidad** del servicio DHCP, de manera que si un servidor falla, el otro pueda continuar proporcionando direcciones IP sin interrupciones.

## Funcionamiento

- Ambos servidores mantienen una **base de datos sincronizada** de direcciones IP disponibles y asignadas.
- Cada servidor puede responder a las solicitudes DHCP de los clientes, siguiendo reglas de balanceo o en modo **activo-pasivo**.
- Si un servidor deja de estar disponible, el servidor secundario asume la responsabilidad de asignar direcciones IP hasta que el servidor primario vuelva a estar en línea.

## Beneficios

- Garantiza disponibilidad continua del servicio DHCP.
- Evita conflictos de IP mediante sincronización entre servidores.
- Permite mantenimiento de servidores sin interrumpir la asignación de direcciones IP a los clientes.

## Archivos locales relevantes

La configuración y gestión del DHCP Failover se realiza a través de archivos locales en el sistema. Algunos de los más importantes son:

- **`/etc/dhcp/dhcpd.conf`**: Archivo principal de configuración del servidor DHCP. Aquí se definen los rangos de direcciones IP, las opciones de red y la configuración de failover entre servidores.
- **`/etc/dhcp/leases/`**: Carpeta donde se almacenan los registros de arrendamiento de IP. Contiene archivos que reflejan las direcciones IP actualmente asignadas a los clientes.
- **`/etc/dhcp/failover.conf`** (opcional según la distribución): Archivo donde se definen los parámetros específicos del failover, como los pares de servidores, el estado de cada servidor y los tiempos de retardo para la conmutación por error.

## Configuración de los servidores

### Servidor principal

- Configuración de fichero `/etc/dhcp/dhcpd.conf`: [dhcpd.conf](configuracion/serv1_dhcpd.conf)
- Configuración de fichero `/etc/default/isc-dhcp-server`: [isc-dhcp-server](configuracion/isc-dhcp-server.conf)
- Configuración de fichero `/etc/netplan/01-network-manager-all.yaml`: [network-manager-all.yaml](configuracion/serv1_01-network-manager-all.yaml)
- Reinicio de servicio DHCP: `sudo service isc-dhcp-server restart`
- Revisión de estado: `service isc-dhcp-server status`

### Servidor secundario

- Configuración de fichero `/etc/dhcp/dhcpd.conf`: [dhcpd.conf](configuracion/serv2_dhcpd.conf)
- Configuración de fichero `/etc/default/isc-dhcp-server`: [isc-dhcp-server](configuracion/isc-dhcp-server.conf)
- Configuración de fichero `/etc/netplan/01-network-manager-all.yaml`: [network-manager-all.yaml](configuracion/serv2_01-network-manager-all.yaml)
- Reinicio de servicio DHCP: `sudo service isc-dhcp-server restart`
- Revisión de estado: `service isc-dhcp-server status`

He unificado los apuntes en este orden: teoría general, DORA, renovación y failover. Las explicaciones en lenguaje natural de DORA las integré en cada fase para no repetir contenido, y la lista numerada de DORA quedó como secciones. También corregí un par de detalles menores, como la "l" suelta en un título y el guion largo de T2.
