extends CanvasLayer

@onready var game = get_parent().get_parent()

func win(value):
	show()
	if value < 0:
		$VBoxContainer/Label3.text = "Shucks! You Lost $"+str(abs(round(value*100.0)/100.0)-game.bet)
	else:
		$VBoxContainer/Label3.text = "Wow! You Ended With $"+str(round(value*100.0)/100.0-game.bet)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/Menu.tscn")
	game.queue_free()
