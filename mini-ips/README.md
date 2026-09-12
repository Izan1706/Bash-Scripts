# 🛡️ mini-ips-bash (Español)
 
Mini **IPS (Intrusion Prevention System)** implementado en Bash puro que analiza logs de autenticación SSH, detecta direcciones IP con múltiples intentos de login fallidos y simula su bloqueo, replicando la lógica que usan herramientas reales como **Fail2Ban**.
 
Proyecto de práctica de scripting en Bash — Estudiante de FP ASIX (Administración de Sistemas Informáticos en Red).
 
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Security](https://img.shields.io/badge/Security-Blue%20Team-informational)
![License](https://img.shields.io/badge/license-MIT-green)
 
---
 
##  Objetivo del proyecto
 
Demostrar el manejo de herramientas clásicas de administración de sistemas Linux (`grep`, `awk`, `sort`, `uniq`, bucles `while read`, estructuras condicionales) aplicadas a un caso de uso real de ciberseguridad: la **detección de ataques de fuerza bruta SSH** a partir del análisis de logs.
El script no depende de ninguna librería externa ni requiere privilegios de root — es 100% Bash puro, pensado para ser legible, auditable y fácil de extender.
 
---
 
##  Cómo funciona (pipeline de procesamiento)
 
```
grep "Failed password"  →  awk (extrae IP)  →  sort  →  uniq -c  →  while read (lógica de bloqueo)
```
 
1. **`grep`** filtra del log únicamente las líneas de intentos de autenticación fallidos.
2. **`awk`** recorre los campos de cada línea y extrae la IP, localizándola dinámicamente justo después de la palabra `"from"` (esto evita errores cuando la posición del campo IP varía, por ejemplo entre usuarios válidos e inválidos).
3. **`sort`** ordena las IPs para que las repetidas queden consecutivas.
4. **`uniq -c`** cuenta cuántas veces aparece cada IP.
5. Un bucle **`while read -r count ip`** recorre el resultado y, si `count` supera el umbral configurado (`MAX_ATTEMPTS`), lanza una alerta y **simula** el bloqueo con un `echo` (nunca ejecuta `iptables` real, pero editando el script es facil de implementar).
---
 
##  Estructura del repositorio
 
```
mini-ips-bash/
├── mini-ips.sh        # Script principal (comentado línea a línea)
├── fake-auth.log       # Log de ejemplo para probar el script sin tocar logs reales
├── README.md
 
```
 
---
 
##  Uso
 
Clona el repositorio y dale permisos de ejecución:
 
```bash
git clone https://github.com/Izan1706/mini-ips-bash.git
cd mini-ips-bash
chmod +x mini-ips.sh
./mini-ips.sh
```
Por defecto analiza el fichero `fake-auth.log` incluido en el repo, con un umbral de `MAX_ATTEMPTS=3`.
 
### Analizar otro log
 
Puedes indicar un log distinto (por ejemplo, un `auth.log` real de un servidor SSH) sin modificar el script, usando una variable de entorno:
```bash
LOG_FILE=/var/log/auth.log ./mini-ips.sh
```
 
### Ejemplo de salida
 
```
==================================================
 Mini-IPS - Analizador de autenticación SSH
 Log analizado : fake-auth.log
 Umbral (MAX_ATTEMPTS): 3 intentos
==================================================
 
--- Resultado del análisis ---
IP: 10.0.0.5 -> Intentos fallidos: 2
IP: 192.168.1.50 -> Intentos fallidos: 3
  [ALERTA] La IP 192.168.1.50 ha superado el umbral de 3 intentos.
  [SIMULACIÓN] Ejecutando bloqueo -> iptables -A INPUT -s 192.168.1.50 -j DROP
  ------------------------------------------------------------
 
Análisis completado.
```
 
---
 
##  Disclaimer de seguridad
 
Este script **no ejecuta ningún bloqueo real**. La línea de `iptables` se muestra únicamente con `echo` a modo demostrativo. Esto es intencionado: el objetivo es servir como pieza de portfolio y herramienta de aprendizaje, no como IPS de producción. Antes de aplicar cualquier bloqueo real en un sistema, se debería:
 
- Validar que la IP no sea una IP de confianza (whitelist).
- Registrar la acción en un log de auditoría propio.
- Aplicar el bloqueo con las herramientas adecuadas (`iptables`, `nftables`, `ufw`, o integrarlo con `Fail2Ban`).
---
 
##  Roadmap / posibles mejoras futuras
 
- [ ] Soporte para whitelist de IPs de confianza.
- [ ] Exportar resultados a CSV o JSON.
- [ ] Integración opcional real con `iptables`/`nftables` protegida por una confirmación manual.
- [ ] Notificación por email o webhook cuando se detecta una IP sospechosa.
---
 
##  Autor
 
**Izan** —
Enfocado en DevOps / SysAdmin / Ciberseguridad.
 
- Portfolio: [izan1706.github.io](https://izan1706.github.io)
- GitHub: [@Izan1706](https://github.com/Izan1706)
---
 
---
 
# 🛡️ mini-ips-bash (English)
 
Mini **IPS (Intrusion Prevention System)** implemented in pure Bash that parses SSH authentication logs, detects IP addresses with multiple failed login attempts, and simulates blocking them — replicating the logic used by real tools like **Fail2Ban**.
 
Bash scripting practice project — built as part of my ongoing learning in Linux system administration.
 
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=gnu-bash&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black)
![Security](https://img.shields.io/badge/Security-Blue%20Team-informational)
![License](https://img.shields.io/badge/license-MIT-green)
 
---
 
## Project goal
 
Demonstrate the use of classic Linux system administration tools (`grep`, `awk`, `sort`, `uniq`, `while read` loops, conditional structures) applied to a real cybersecurity use case: **detecting SSH brute-force attacks** through log analysis.
The script has no external dependencies and doesn't require root privileges — it's 100% pure Bash, designed to be readable, auditable, and easy to extend.
 
---
 
## How it works (processing pipeline)
 
```
grep "Failed password"  →  awk (extracts IP)  →  sort  →  uniq -c  →  while read (blocking logic)
```
 
1. **`grep`** filters the log to keep only failed authentication attempt lines.
2. **`awk`** walks through each line's fields and extracts the IP, locating it dynamically right after the word `"from"` (this avoids errors when the IP field position varies, e.g. between valid and invalid users).
3. **`sort`** orders the IPs so repeated ones end up consecutive.
4. **`uniq -c`** counts how many times each IP appears.
5. A **`while read -r count ip`** loop goes through the result and, if `count` exceeds the configured threshold (`MAX_ATTEMPTS`), raises an alert and **simulates** the block with an `echo` (it never runs real `iptables`, but it's easy to implement by editing the script).
---
 
## Repository structure
 
```
mini-ips-bash/
├── mini-ips.sh        # Main script (commented line by line)
├── fake-auth.log       # Sample log to test the script without touching real logs
├── README.md
 
```
 
---
 
## Usage
 
Clone the repository and give it execution permissions:
 
```bash
git clone https://github.com/Izan1706/mini-ips-bash.git
cd mini-ips-bash
chmod +x mini-ips.sh
./mini-ips.sh
```
By default it analyzes the included `fake-auth.log` file, with a threshold of `MAX_ATTEMPTS=3`.
 
### Analyzing a different log
 
You can point to a different log (e.g. a real SSH server's `auth.log`) without modifying the script, using an environment variable:
```bash
LOG_FILE=/var/log/auth.log ./mini-ips.sh
```
 
### Example output
 
```
==================================================
 Mini-IPS - SSH authentication analyzer
 Log analyzed : fake-auth.log
 Threshold (MAX_ATTEMPTS): 3 attempts
==================================================
 
--- Analysis result ---
IP: 10.0.0.5 -> Failed attempts: 2
IP: 192.168.1.50 -> Failed attempts: 3
  [ALERT] IP 192.168.1.50 exceeded the threshold of 3 attempts.
  [SIMULATION] Running block -> iptables -A INPUT -s 192.168.1.50 -j DROP
  ------------------------------------------------------------
 
Analysis complete.
```
 
---
 
## Security disclaimer
 
This script **does not perform any real blocking**. The `iptables` line is shown only via `echo` for demonstration purposes. This is intentional: the goal is to serve as a portfolio piece and learning tool, not a production IPS. Before applying any real blocking on a system, you should:
 
- Validate that the IP is not a trusted one (whitelist).
- Log the action to its own audit trail.
- Apply the block with the appropriate tools (`iptables`, `nftables`, `ufw`, or integrate it with `Fail2Ban`).
---
 
## Roadmap / possible future improvements
 
- [ ] Support for a trusted IP whitelist.
- [ ] Export results to CSV or JSON.
- [ ] Optional real integration with `iptables`/`nftables`, protected by manual confirmation.
- [ ] Email or webhook notification when a suspicious IP is detected.
---
 
## Author
 
**Izan** —
Focused on DevOps / SysAdmin / Cybersecurity.
 
- Portfolio: [izan1706.github.io](https://izan1706.github.io)
- GitHub: [@Izan1706](https://github.com/Izan1706)
---
