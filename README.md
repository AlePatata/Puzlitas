# Puzlitas

## Principales Funcionalidades Para no Perderse
En `/lvlAle`: 
- light.tscn y light.gd: escena y script objetos perdidos
- object.gd: constructor clase Objeto
- RecogerHope.gd: esta escena tiene el diálogo del gatito y se pueden guardar las palabras en el diccionario
- Game.gd: un autoload que almacena la información del inventario
- Globals.gd: un autoload que almacena el estado de ciertas variables que el usuario puede modificar entre escenas. 

##Cómo funciona GET YOUR LIFE TOGETHER?
SI. Se sigue una serie de condiciones para que puedas ordenar los objetos que están relativamente juntos:
- Un objeto puede ser arrastrado con el mouse y bajo cierta linea en la pantalla (para evitar levantar los objetos demasiado)
- Un objeto sabe si otro objeto entra en su collisionShape
- El nodo Objetos en light.tscn sabe cuando los 3 objetos están juntos. Esto se hace con un diccionario {objeto.name : bool}, donde si los objetos envían individualmente sus señales de estar juntos entonces los values del diccionario serán true.
- La palabra se connect a esa señal del nodo Objetos y hace su magia.
- Al mismo tiempo, si la palabra Get your life together entra en el área 2d de algún objeto, este llamará a la función getyourlifetogether() del nodo Objects (su nodo padre).
- La función getyourlifetogether() volverá true una variable que indica que se usó dicha palabra ssi todos los objetos están sobre el otro.
- Si se cumple que tres objetos del grupo Objects están juntos, y además se usó getyourlifetogether, entonces se ejecuta la función hacerlacama()
- La función hacerlacama() cambiará el sprite de bed y eliminará los objetos pillow, blanket y la palabra usada (todo mediante señales al nodo light y luego al resto.

##Cómo funciona HOPE?
- La palabra hope, cuando se saca del diccionario usando la función tomar_palabra() de la ui_palabra.gd, emite la señal de prender_luz, que se envía a directamente a whiteCircle.gd
- whiteCircle.gd revisa cada hijo de PalabraContainer y se conecta a su señal de prender_luz.
- Dentro de whiteCircle se almacena como true o false si hay que ocultar o mostrar la luz.
- swtich.gd posee una señal que detecta si whiteCircle entró a su area 2d, y si lo hace se muestra
- si se hace click en el switch mientras se tiene el whiteCircle activo, entonces se encenderá toda la habitación mediante una señal a background.gd (hope.emit())
- Esta acción también enviará una señal a light para eliminar la palabra hope. 

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


### Shaders :)
Los shaders son como filtros que aplican una cierta accion a cada pixel de la pantalla y le cambian sus propiedades. Como trabajan a nivel de pixeles no interrumpen los procesos internos que se hacen para que el jueguito corra y haga todas sus cosas jueguísticas, es literal como un filtro confía :) \
Lo malo es que se escriben en otro lenguaje llamado Shading language y tiene extensión  `.gdshader`, lo bueno es que el autocompletado apaña. Tú solo sigue este tutorial y estarás bien: \

https://www.youtube.com/watch?v=gqe0InyIk4U
