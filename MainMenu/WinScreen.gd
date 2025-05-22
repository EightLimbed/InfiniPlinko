extends Control

func win(value):
	show()
	if value < 0.00000000000001:
		$VBoxContainer/Label3.text = "You Lost Everything"
	elif value < 100:
		$VBoxContainer/Label3.text = "Shucks! You Only Have: $"+str(value)+" Left"
	else:
		$VBoxContainer/Label3.text = "Wow! You Ended With: $"+str(value)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/Menu.tscn")
	get_parent().get_parent().queue_free()
