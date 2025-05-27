extends CanvasLayer

@onready var game = get_parent().get_parent()
var save_file = preload("res://Save/SavedGames.tres")

func win(value):
	show()
	if ResourceLoader.exists("user://SavedGames.tres"):
		save_file = ResourceLoader.load("user://SavedGames.tres")
	save_file.saved_bets.append(game.bet)
	save_file.saved_profits.append(round(value*100.0)/100.0-game.bet)
	ResourceSaver.save(save_file,"user://SavedGames.tres")
	if value < 0:
		$VBoxContainer/Label3.text = "Shucks! You Lost $"+str(abs(round(value*100.0)/100.0)-game.bet)
	else:
		$VBoxContainer/Label3.text = "Wow! You Made $"+str(round(value*100.0)/100.0-game.bet)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://MainMenu/Menu.tscn")
	game.queue_free()
