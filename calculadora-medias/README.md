# 📊 Calculadora de Notas en Bash

Script de Bash que calcula la media de un conjunto de notas introducidas por el usuario y devuelve un mensaje según el resultado obtenido.

Es uno de mis primeros scripts serios en Bash. Lo comparto como parte de mi proceso de aprendizaje: todavía estoy familiarizándome con la sintaxis, el manejo de variables y las estructuras de control del lenguaje, y este proyecto me ha servido para practicar bucles, condicionales y aritmética con enteros.

## 🧠 ¿Qué hace?

1. Pide notas al usuario, una por una, entre `0` y `10`.
2. Valida que la nota introducida esté dentro de ese rango.
3. Va acumulando la suma y el número de notas introducidas.
4. Al escribir `q`, calcula la media y muestra un mensaje distinto según el resultado:
   - Media > 9 → "Muy bien hecho"
   - Media > 7 → "Muy bien, ¿podemos hacerlo aún mejor?"
   - Media > 5 → "Aprobado, pero mejora un poco más"
   - Media ≤ 5 → "Deberías mejorar esa nota"

## ▶️ Uso

```bash
chmod +x notas.sh
./notas.sh
```

Ejemplo de ejecución:

```
Escribe tus notas de 0 a 10, ('q' for quit): 8
Escribe tus notas de 0 a 10, ('q' for quit): 6
Escribe tus notas de 0 a 10, ('q' for quit): 9
Escribe tus notas de 0 a 10, ('q' for quit): q
Tu media es de 7
Muy bien, ¿podemos hacerlo aún mejor??
FIN
```

## ⚙️ Requisitos

- Bash (probado en Bash 4+ / Linux)

## 🔧 Cómo funciona por dentro

- El script usa un `while true` para forzar la entrada continua de notas hasta que el usuario escribe `q`.
- Cada nota se valida con una comparación aritmética `(( ))` para asegurarse de que está entre 0 y 10.
- La suma y el número de notas se guardan en `SUM` y `NUM`, y la media se calcula con aritmética de enteros usando `$[ ]` (sintaxis heredada, equivalente a `$(( ))`).

## 🚧 Cosas que sé que se pueden mejorar

Al ser un script de aprendizaje, soy consciente de que tiene margen de mejora, y quiero dejarlo documentado como parte del proceso:

- **División entera**: al usar aritmética de enteros, la media se trunca (por ejemplo, 7.9 se muestra como 7). Una mejora futura sería usar `bc` o `awk` para trabajar con decimales.
- **Sintaxis moderna**: `$[ ]` está en desuso; lo correcto hoy en día es `$(( ))`.
- **Validación de entrada**: no comprueba que el valor introducido sea realmente un número antes de compararlo, lo que podría dar comportamientos inesperados con ciertos caracteres.

## 📄 Licencia

MIT
