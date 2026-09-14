# 🚀 Samba NAS Automated Setup Script

Script en Bash para automatizar la instalación, configuración y despliegue de un servidor **NAS local mediante Samba**.
Ideal para entornos de pruebas o administración de sistemas donde se requiere desplegar almacenamiento compartido de red de forma rápida y repetible en múltiples equipos.

---

##  Advertencias e Información Importante

> **¡ATENCIÓN! LEA ANTES DE EJECUTAR:**
> 1. **Pérdida de datos:** El script **formatea automáticamente** la unidad asignada al NAS. Asegúrese de respaldar cualquier información importante antes de continuar.
> 2. **Unidad por defecto:** Por defecto, el script utiliza el disco `/dev/sdb`. **Verifique y modifique este parámetro en el script** si su unidad tiene otra nomenclatura (ej. `/dev/sdc`, `/dev/nvme0n1`, etc.).
> 3. **Mantenga SAMBA actualizado**
> 4. **Credenciales por defecto:**
>    * **Usuario:** `nasuser`
>    * **Contraseña:** `P@ssw0rd`
>    * 🔒 *Por razones de seguridad, cambie estas credenciales inmediatamente después de la instalación.*

---

## 📋 Prerrequisitos

* Sistema operativo basado en Linux (Debian/Ubuntu recomendado).
* Permisos de superusuario (`sudo` o `root`).
* Conexión a Internet activa (necesaria para descargar los paquetes de Samba y sus dependencias). Si no dispone de conexión, deberá instalar Samba previamente de forma manual.

---

## ⚙️ Configuración Previa

Antes de ejecutar el script, revise los siguientes puntos en el código fuente:

1. **Identifique su disco:** Compruebe la ruta del disco que desea usar como NAS con el comando:
   ```bash
   lsblk
