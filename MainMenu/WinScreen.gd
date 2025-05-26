extends CanvasLayer

@onready var game = get_parent().get_parent()

func win(value):
	show()
	if not ResourceLoader.exists("user://save/SavedGames.tres"):
		ResourceSaver.save(ResourceLoader.load("res://Save/SavedGames.tres"),"user://save/SavedGames.tres")
		print("created")
	var old_save = ResourceLoader.load("user://save/SavedGames.tres")
	old_save.saved_bets.append(game.bet)
	old_save.saved_profits.append(round(value*100.0)/100.0-game.bet)
	ResourceSaver.save(old_save,"user://save/SavedGames.tres")
	if value < 0:
		$VBoxContainer/Label3.text = "Shucks! You Lost $"+str(abs(round(value*100.0)/100.0)-game.bet)
	else:
		$VBoxContainer/Label3.text = "Wow! You Made $"+str(round(value*100.0)/100.0-game.bet)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/Menu.tscn")
	game.queue_free()
