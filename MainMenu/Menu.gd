extends CanvasLayer
@onready var Graph = $"Info/Probability Distrubution"
@onready var info = $Info
func _on_button_pressed() -> void:
	if str($VBoxContainer/Label3/TextEdit.text).is_valid_int():
		var instance = load("res://Main/Game.tscn").instantiate()
		instance.bet = int($VBoxContainer/Label3/TextEdit.text)
		instance.risk = $VBoxContainer/Label2/HSlider.value
		get_tree().root.add_child(instance)
		queue_free()


func _on_info_button_pressed() -> void:
	info.visible = not info.visible
	if info.visible == true:
		$InfoButton.text = "Home"
	else:
		$InfoButton.text = "Info"


func _on_graph_button_pressed() -> void:
	Graph.visible = not Graph.visible
	if Graph.visible == true:
		$"Info/Calc/Graph Button".text = "Back"
		$InfoButton.visible = false
	else:
		$"Info/Calc/Graph Button".text = "Probability Distrubution Example"
		$InfoButton.visible = true
