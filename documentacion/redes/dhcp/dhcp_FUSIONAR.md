# Teoría General: DHCP (Dynamic Host Configuration Protocol)

El protocolo **DHCP** opera en la capa de aplicación y funciona bajo una arquitectura cliente-servidor (utilizando los puertos UDP 67 y 68). Su función principal es **automatizar y gestionar la asignación de direcciones IP** y otros parámetros de red (como la máscara de subred, la puerta de enlace predeterminada y los servidores DNS) a los dispositivos que se conectan a una red.

Sin DHCP, los administradores de red tendrían que configurar manualmente cada dispositivo (IP estática), lo cual es ineficiente y muy propenso a errores (como asignar la misma IP a dos equipos distintos).

## l Proceso DORA (El ciclo de vida de la asignación)

Cuando un dispositivo (cliente) se conecta a una red y está configurado para obtener una IP automáticamente, se inicia una negociación con el servidor DHCP conocida por su acrónimo **DORA**:

1. **D - Discover (Descubrir):** El cliente no tiene IP y no sabe quién es el servidor DHCP. Envía un mensaje de difusión (Broadcast) a toda la red diciendo: *"Soy nuevo aquí, ¿hay algún servidor DHCP que me pueda dar una IP?"*.
2. **O - Offer (Ofrecer):** El servidor DHCP (o servidores, si hay varios) recibe el mensaje y responde con una oferta. Le envía un mensaje al cliente diciendo: *"Tengo esta dirección IP disponible para ti, junto con la máscara y el router"*.
3. **R - Request (Solicitar):** El cliente recibe la oferta (si recibe varias, suele aceptar la primera que llega). Envía un nuevo mensaje de difusión diciendo: *"Acepto la oferta del Servidor X. Por favor, resérvame esa IP"*. (Se envía por difusión para que los otros servidores DHCP sepan que su oferta fue rechazada).
4. **A - Acknowledge (Confirmar):** El servidor seleccionado registra la IP como "ocupada" en su base de datos y envía un mensaje final al cliente diciendo: *"Confirmado. La IP es tuya. Aquí tienes el resto de la configuración y el tiempo de concesión"*.

## Conceptos Clave de DHCP

* **Ámbito (Scope):** Es el rango o conjunto de direcciones IP consecutivas que el servidor DHCP tiene permitido asignar. Por ejemplo, de la `192.168.1.100` a la `192.168.1.200`.
* **Tiempo de Concesión (Lease Time):** Las direcciones IP **no se regalan, se alquilan**. El servidor asigna la IP por un tiempo determinado (por ejemplo, 8 horas o 7 días). Cuando transcurre la mitad de ese tiempo, el cliente intenta renovar el alquiler. Si el dispositivo se desconecta y el tiempo expira, la IP vuelve al grupo (pool) para ser asignada a otro equipo.
* **Reserva (Reservation):** Es una regla en el servidor DHCP que vincula una dirección IP específica a la dirección física (MAC Address) de un dispositivo. Garantiza que dispositivos críticos (como una impresora de red o un servidor local) siempre reciban la misma IP dinámicamente, simulando una IP estática sin necesidad de configurarla a mano en el equipo.
