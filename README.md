# Puzlitas

## Mini tutoriales (para guiarnos y porque se me olvida como hacer todo)
### Cómo hacer un botón bonito que se muestre desps de algo
- Crear un Area2d, polerle collisionShape y alguna Sprite2D bonita
- Adjuntarle un script
- en la función ready() ponerle connect("input_event", self, "_método_q_quieras_ejecutar_al_pulsar")
- En el nodo padre donde quieras tu boton lo citas (@onready var ...)
- Cuando ese algo pase, llamas a la función para mostrarse de tu boton