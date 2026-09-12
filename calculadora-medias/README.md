# 📊 Calculadora de Notas en Bash (Español)
 
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
 
---
 
 
# 📊 Grade Calculator in Bash (English)
 
Bash script that calculates the average of a set of grades entered by the user and returns a message based on the result obtained.
 
This is one of my first serious Bash scripts. I'm sharing it as part of my learning process: I'm still getting familiar with the language's syntax, variable handling, and control structures, and this project has helped me practice loops, conditionals, and integer arithmetic.
 
## 🧠 What it does
 
1. Asks the user for grades, one by one, between `0` and `10`.
2. Validates that the entered grade is within that range.
3. Accumulates the sum and the number of grades entered.
4. When the user types `q`, it calculates the average and shows a different message depending on the result:
   - Average > 9 → "Muy bien hecho" ("Very well done")
   - Average > 7 → "Muy bien, ¿podemos hacerlo aún mejor?" ("Very good, can we do even better?")
   - Average > 5 → "Aprobado, pero mejora un poco más" ("Passed, but improve a bit more")
   - Average ≤ 5 → "Deberías mejorar esa nota" ("You should improve that grade")
## ▶️ Usage
 
```bash
chmod +x notas.sh
./notas.sh
```
 
Example run:
 
```
Escribe tus notas de 0 a 10, ('q' for quit): 8
Escribe tus notas de 0 a 10, ('q' for quit): 6
Escribe tus notas de 0 a 10, ('q' for quit): 9
Escribe tus notas de 0 a 10, ('q' for quit): q
Tu media es de 7
Muy bien, ¿podemos hacerlo aún mejor??
FIN
```
 
## ⚙️ Requirements
 
- Bash (tested on Bash 4+ / Linux)
## 🔧 How it works internally
 
- The script uses a `while true` loop to force continuous grade entry until the user types `q`.
- Each grade is validated with an arithmetic comparison `(( ))` to make sure it's between 0 and 10.
- The sum and number of grades are stored in `SUM` and `NUM`, and the average is calculated using integer arithmetic with `$[ ]` (legacy syntax, equivalent to `$(( ))`).
## 🚧 Known areas for improvement
 
Since this is a learning script, I'm aware it has room for improvement, and I want to document that as part of the process:
 
- **Integer division**: since it uses integer arithmetic, the average is truncated (e.g. 7.9 is shown as 7). A future improvement would be to use `bc` or `awk` to work with decimals.
- **Modern syntax**: `$[ ]` is deprecated; the correct approach today is `$(( ))`.
- **Input validation**: it doesn't check whether the entered value is actually a number before comparing it, which could lead to unexpected behavior with certain characters.
## 📄 License
 
MIT
 
