Si querías la hogaza entera y no solo las migajas, profundicemos en las entrañas criptográficas y funcionales de SSH. Más allá de conectar dos máquinas, es un ecosistema completo de seguridad.

# Arquitectura y Funcionamiento Interno de SSH

SSH no es un simple túnel; opera utilizando una combinación de tres tecnologías criptográficas diferentes para garantizar que la conexión sea privada, íntegra y autenticada.

## El Trípode Criptográfico

**Cifrado Asimétrico (Clave Pública/Privada)**
Solo se utiliza durante la fase inicial. Sirve para autenticar la identidad del cliente y del servidor (evitando ataques *Man-in-the-Middle*) y para negociar de forma segura la clave de sesión. Los algoritmos modernos recomendados son Ed25519 o ECDSA.

**Cifrado Simétrico (Clave de Sesión)**
Una vez establecida la conexión inicial, SSH cambia a este cifrado para transmitir todos los datos. Cliente y servidor generan una única clave secreta compartida (a menudo usando el algoritmo Diffie-Hellman) que cifra toda la comunicación de la sesión. Es mucho más rápido que el asimétrico y utiliza algoritmos como AES o ChaCha20.

**Hashing y MAC (Message Authentication Code)**
Para garantizar que nadie altere los paquetes de datos durante el viaje, SSH utiliza funciones de hash (como SHA-256). Cada mensaje enviado incluye un sello criptográfico (MAC); si un solo bit es modificado por el camino, el hash cambia, el receptor detecta la manipulación y la conexión seEl protocolo SSH opera en la capa de aplicación (Capa 7 del modelo OSI) y su función no se limita a ocultar una contraseña, sino que encapsula todo el tráfico de red en un canal impenetrable. Su arquitectura es compleja y fundamenta su seguridad en la combinación simultánea de tres paradigmas criptográficos distintos para garantizar confidencialidad, autenticidad e integridad.

**Criptografía aplicada en SSH**

* **Cifrado asimétrico:** Se emplea exclusivamente al inicio de la conexión. Cliente y servidor usan pares de claves pública/privada (como RSA, ECDSA o Ed25519) para identificarse mutuamente y establecer las bases matemáticas de la comunicación de forma segura.
* **Cifrado simétrico:** Una vez autenticados, ambos extremos acuerdan una clave secreta compartida temporal y exclusiva para esa sesión. Todo el flujo de datos posterior se encripta con algoritmos simétricos (como AES o ChaCha20), ya que son infinitamente más rápidos para procesar grandes volúmenes de información en tiempo real.
* **Hashing (Algoritmos HMAC):** Para evitar que un atacante intercepte y modifique fragmentos de información, SSH adjunta a cada paquete de datos un código de autenticación de mensajes basado en hashes (como SHA-256). Si un solo bit es alterado en tránsito, el receptor detecta la anomalía y descarta el paquete.

**El proceso de conexión (Handshake)**

* **Negociación de capacidades:** Cliente y servidor intercambian las versiones de protocolo soportadas y deciden qué algoritmos criptográficos utilizarán, eligiendo siempre la opción más fuerte que ambos tengan en común.
* **Intercambio Diffie-Hellman:** Mediante este algoritmo matemático, ambos equipos generan de forma colaborativa la clave simétrica de sesión sin llegar a transmitirla jamás por la red, haciendo inútil cualquier escucha clandestina.
* **Validación del servidor:** El cliente exige al servidor que demuestre su identidad. La clave del servidor se contrasta contra el archivo local `~/.ssh/known_hosts` para prevenir ataques de intermediario (*Man-in-the-Middle*).
* **Autenticación del usuario:** El servidor solicita al cliente que demuestre quién es, ya sea pidiendo una contraseña plana o, de forma más segura, enviando un desafío criptográfico que el cliente solo podrá resolver si posee la clave privada correcta.

**Funciones avanzadas del protocolo**

* **Túneles (Port Forwarding):** SSH permite secuestrar tráfico de otros protocolos (como consultas a bases de datos o navegación web HTTP) y enrutarlo a través de su conexión cifrada, logrando evadir firewalls restrictivos o dotando de seguridad a servicios que por defecto carecen de ella.
* **Protocolos derivados:** SSH actúa como capa de transporte subyacente para herramientas especializadas en la copia y sincronización de datos, dando vida a utilidades como SFTP (SSH File Transfer Protocol), SCP o rsync.
* **Reenvío gráfico (X11):** No solo transmite texto plano. SSH es capaz de capturar la interfaz gráfica de un programa ejecutado en un servidor Linux remoto y renderizar sus ventanas directamente en la pantalla de tu equipo local.
* **Multiplexación de sesiones:** Permite establecer una única conexión maestra en segundo plano y canalizar múltiples terminales nuevas a través de ella, eliminando el coste de tiempo de CPU y red que supone realizar el *handshake* criptográfico cada vez que abres una pestaña nueva.
