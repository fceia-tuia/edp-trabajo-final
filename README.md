# Entorno de Programación - Trabajo Práctico Final - Grupo 8

## Setup

Si en lugar de usar el texto de muestra incluído en el repositorio se desea usar uno personalizado, reemplazar el contenido de _text.txt_ con el deseado.

Teniendo Docker instalado, y posicionandose en el directorio raíz del proyecto (donde se encuentra _Dockerfile_), correr el comando `docker build -t "edp:grupo-8" .`

## Ejecución

Una vez hecha la build de la imagen, ejecutar `docker run -it edp:grupo-8`

Esto mostrará un menu en la consola en el cual presentara 15 opciones.

### Opción 1: Word length stats

Al seleccionar esta opción se analizará el texto para luego mostrar las siguientes estádisticas:

- La palabra con mayor cantidad de caracteres
- La palabra con menor cantidad de caracteres
- La longitud promedio en caracteres de las palabras

### Opción 2: Word usage stats

Al seleccionar esta opción se analizará el texto para luego mostrar las diez palabras más usadas ordenadas de la más a la menos frecuente. Como condición, además, las palabras deberan tener cuatro o más letras.

### Opción 3: Find names

Al seleccionar esta opción se analizará el texto para luego mostrar los nombres propios. Se considera nombre propio a cualquier palabra que comience con una letra mayúscula, seguida de letras minúsculas.

### Opción 4: Sentence length stats

Al seleccionar esta opción se analizará el texto para luego mostrar las siguientes estádisticas:

- La oración más corta
- La oración más larga
- La longitud promedio en caracteres de las oraciones

### Opción 5: Blank lines counter

Al seleccionar esta opción se analizará el texte para luego mostrar la cantidad de líneas en blanco que contiene.

### Opción 6: Case converter

Al seleccionar esta opción se analizará el texto para luego mostrarlo con mayúsculas y minúsculas invertidas. Es decir, en la salida lo que originalmente estaba escrito con letra mayúscula se vera con letra minúscula y viceversa.

### Opción 7: Substring Replace

Al seleccionar esta opción se pedira ademas ingresar una cadena a buscar y la cadena con la cual reemplazar la cadena a buscar en caso de que sea encontrada. Se analizará el texto entonces para luego mostrarlo con la segunda cadena en donde se encuentre todas las ocurrencias de la primera. Distingue entre mayúsculas y minúsculas e ignora tildes.

### Opción 8: Block selection

Al seleccionar esta opción se pedira ademas seleccionar un elemento que podrá ser oración o parrafo y luego una posición. Se analizará entonces el texto para luego mostrar el elemento seleccionado en la posición seleccionada. If user inputs an invalid value on any prompt, it will show an error message.

### Opción 9: Palindrome detection

Al seleccionar esta opción se analizará el texto para luego mostrar los palíndromos que contiene. Se ignorarán mayúsculas, minúsculas y acentuación.

### Opción 10: One vowel words

Al seleccionar esta opción se analizará el texto para luego mostrar todas las palabras que contengan más de tres letras y una sola vocal. Se ignorarán la acentuación.

### Opción 11: All uppercase words

Al seleccionar esta opción se analizará el texto para luego mostrar todas las palabras que contengan todas sus letras mayúsculas. No se considerará palabra a cualquier cadena que contenga uno o más números.

### Opción 12: All vowels Words

Al seleccionar esta opción se analizará el texto para luego mostrar todas las palabras que contengan todas las vocales al menos una vez. Para aquellas palabras que aparezcan más de una vez se mostrara entre parentesis también la cantidad de veces que se han encontrado.

### Opción 13: Email adress detection

Al seleccionar esta opción se analizará el texto para luego mostrar todas las direcciones de correo electrónico que se encuentren en el mismo, ordenadas alfabeticamente.

### Opción 14: Integer detection

Al seleccionar esta opción se analizará el texto para luego mostrar todos los números enteros que se encuentren ordenados de forma ascendentes. Números escritos como 3.5 o 3,5 serán considerados como números decimales y no se mostraran tampoco como enteros separados (3 y 5), en otras palabras serán totalmente ignorados para respetar las distintas formas de escribir números decimales (con coma y con punto).

### Opción 15: Exit

Al seleccionar esta opción el programa finaliza.
