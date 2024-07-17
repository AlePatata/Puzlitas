extends RichTextLabel

func _ready():
	# Habilitar BBCode
	bbcode_enabled = true

	# Llamar a la función para actualizar el texto al inicio
	update_rich_text_label()

	# Usar un timer para actualizar periódicamente
	var timer = Timer.new()
	timer.wait_time = 0.5 # Actualiza cada 0.5 segundos
	timer.timeout.connect(_on_timeout)
	add_child(timer)
	timer.start()

func _on_timeout():
	update_rich_text_label()

func update_rich_text_label():
	text = ""
	#if Globals.var1:
	text += "[size=24][color=green]Variable 1 is True[/color][/size]\n"
	#else:
	#	text += "[size=24][color=red]Variable 1 is False[/color][/size]\n"

	#if Globals.var2:
	#	text += "[size=24][color=green]Variable 2 is True[/color][/size]\n"
	#else:
	#	text += "[size=24][color=red]Variable 2 is False[/color][/size]\n"

	
