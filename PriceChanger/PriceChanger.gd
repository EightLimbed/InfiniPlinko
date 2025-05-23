extends Area2D

var value : float = 1
var offset
@onready var game = get_parent()

#make sure to only place multipliers every second row.
#Ranges between /10 and *10 (/10 in middles, *10 in outside). gradiant depends on layer of pascals triangle.
func _ready():
	var new_pos = (position-offset)/Vector2(192,96)
	value = val_from_pos(new_pos)
	if round(value*100.0)/100.0 == 0:
		value = 0
	if value == 0:
		$Label.text = "+1 \nBounces"
		$Sprite2D.modulate = "ffff00c8"
		#queue_free()
	elif value < 0:
		$Label.text = str(round(value*100.0)/100.0)
		$Sprite2D.modulate = "ff0000c8"
	else:
		$Label.text = "+"+str(round(value*100.0)/100.0)
		$Sprite2D.modulate = "00ff00c8"

func _process(_delta: float) -> void:
	var factor = min(1,70.0/$Label.size.x)
	$Label.scale = Vector2(factor,factor)
	$Label.position = Vector2(-40,-67)

func val_from_pos(pos):
	return game.bet*nCr(pos.y,(abs(abs(pos.x)-(pos.y+1)*(sign(pos.x)+1)/2))-0.5)/(nCr(pos.y,abs(pos.x)+(pos.y/2.0)))-game.bet-game.loss/2**pos.y

func nCr(n, r) -> float:
	return factorial(n) / (factorial(r) * factorial(n - r))

func factorial(num : int):
	var result = 1
	for i in range(1, num+1):
		result *= i
	return result

func _on_area_entered(area: Area2D) -> void:
	var target = area.get_parent()
	var new_value = target.value + value
	get_parent().get_node("CanvasLayer/Money").text = "Money: $"+str(round(new_value*100.0)/100.0)
	target.value = new_value
	if value == 0:
		target.bounces += 1
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
