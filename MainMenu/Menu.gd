extends Control

func _on_button_pressed() -> void:
	if str($VBoxContainer/Label3/TextEdit.text).is_valid_int():
		var instance = load("res://Main/Game.tscn").instantiate()
		instance.bet = int($VBoxContainer/Label3/TextEdit.text)
		instance.risk = $VBoxContainer/Label2/HSlider.value
		get_tree().root.add_child(instance)
		queue_free()
