# Puzlitas

## Principales Funcionalidades Para no Perderse
En `/lvlAle`: 
- light.tscn y light.gd: escena y script objetos perdidos
- object.gd: constructor clase Objeto
-

##Cómo funciona PUT YOUR LIFE TOGHETER?
SI. Se sigue una serie de condiciones para que puedas ordenar los objetos que están relativamente juntos:
- Un objeto puede ser arrastrado con el mouse y bajo cierta linea en la pantalla (para evitar levantar los objetos demasiado)
- Un objeto sabe si otro objeto entra en su collisionShape
- El nodo Objetos en light.tscn sabe cuando los 3 objetos están juntos. Esto se hace con un diccionario {objeto.name : bool}, donde si los objetos envían individualmente sus señales de estar juntos entonces los values del diccionario serán true.
- La palabra se connect a esa señal del nodo Objetos y hace su magia.

## Mini tutoriales (para guiarnos y porque se me olvida como hacer todo)
### Cómo hacer un botón bonito que se muestre desps de algo
- Crear un Area2d, polerle collisionShape y alguna Sprite2D bonita
- Adjuntarle un script
- en la función ready() ponerle connect("input_event", self, "_método_q_quieras_ejecutar_al_pulsar")
- En el nodo padre donde quieras tu boton lo citas (@onready var ...)
- Cuando ese algo pase, llamas a la función para mostrarse de tu botón

### Señales :0
Siguen más o menos el patrón de diseño de un Observer, donde existen 2 entidades: un observador y un observado. En este contexto el observado debe emitir una señal, y el observador debe conectarse a esa señal y recibirla.\
Entonces hay que:
- en el observado: añadir al principio del script el nombre de la señal `signal nombre_señal`, y emitir la señal dentro de la funcionalidad de tu código al peo con `nombre_señal.emit()`

- En el observador debes: citar al observado con su @onready Observado = $direccion/relativa/jaja. Debes definir además una función a ejecutar la que quieres q se ejecute cuando recibas la señal indicada. Finalmente dentro de una función (típicamente en _ready()) conectarte a la señal con `Observado.connect(nombre_señal, _funcion_a_ejecutar)`

Ojo: para ponerle parámetros a la función dentro de connect seguir alguna de estas formas: https://stackoverflow.com/questions/77360041/how-to-connect-a-signal-with-extra-arguments-in-godot-4

Listooo, si no te funciona eres muy perkin y probablemente me faltó escribir un paso :C