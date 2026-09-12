#!/bin/bash

# mini-ips.sh
# ------------------------------------------------------------------
# Mini-IPS (Intrusion Prevention System) en Bash puro.
# Analiza un log de autenticación SSH, cuenta los intentos fallidos
# por IP y "bloquea" (simulado) las que superan un umbral.

# Autor: Izan
# ------------------------------------------------------------------

LOG_FILE="${LOG_FILE:-fake-auth.log}"
# la IP como sospechosa y "bloquearla".
MAX_ATTEMPTS=3

if [ ! -f "$LOG_FILE" ]; then
    echo "[ERROR] No se encuentra el fichero de log: $LOG_FILE"
    exit 1
fi

echo "=================================================="
echo " Mini-IPS - Analizador de autenticación SSH"
echo " Log analizado : $LOG_FILE"
echo " Umbral (MAX_ATTEMPTS): $MAX_ATTEMPTS intentos"
echo "=================================================="
echo

extract_and_count() {
    grep "Failed password" "$LOG_FILE" | \
    awk '{
        # Recorremos todos los campos de la línea ($1 hasta $NF)
        for (i = 1; i <= NF; i++) {
            # Cuando encontramos la palabra "from", sabemos que
            # el SIGUIENTE campo (i+1) es la IP.
            if ($i == "from") {
                print $(i+1)
            }
        }
    }' | \
    sort | \
    uniq -c
}

echo "--- Resultado del análisis ---"
extract_and_count | while read -r count ip; do

    echo "IP: $ip -> Intentos fallidos: $count"

    # ================================================================
    # FASE DE BLOQUEO (simulada)
    # ================================================================

    if [ "$count" -ge "$MAX_ATTEMPTS" ]; then
        echo "  [ALERTA] La IP $ip ha superado el umbral de $MAX_ATTEMPTS intentos."
        # Por seguridad NO ejecutamos un bloqueo real con iptables/ufw.
        # Simulamos la acción con un simple echo, tal y como se pediría
        # a un SOC/Blue Team antes de aplicar cambios en producción.
        echo "  [SIMULACIÓN] Ejecutando bloqueo -> iptables -A INPUT -s $ip -j DROP"
        echo "  ------------------------------------------------------------"
    fi
done

echo
echo "Análisis completado."
