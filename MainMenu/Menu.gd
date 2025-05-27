extends CanvasLayer

func _on_button_pressed() -> void:
	if str($VBoxContainer/Label3/TextEdit.text).is_valid_int():
		var instance = load("res://Main/Game.tscn").instantiate()
		instance.bet = int($VBoxContainer/Label3/TextEdit.text)
		instance.risk = $VBoxContainer/Label2/HSlider.value
		get_tree().root.add_child(instance)
		queue_free()

func _on_info_button_pressed() -> void:
	$Info.visible = not $Info.visible
	if $Info.visible == true:
		$InfoButton.text = "Close"
	else:
		$InfoButton.text = "Info"

func _on_graph_button_pressed() -> void:
	if $Info/Calculator.position.y > 0:
		$Info/Calculator/GraphButton.text = "Close"
		$Info/AnimationPlayer.play("CalculatorAppear")
	else:
		$Info/Calculator/GraphButton.text = "Example Calculation"
		$Info/AnimationPlayer.play("CalculatorDissapear")
