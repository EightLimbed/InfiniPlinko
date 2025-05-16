extends Area2D

@export var value : float = 1

#make sure to only place multipliers every second row.
#Ranges between /10 and *10 (/10 in middles, *10 in outside). gradiant depends on layer of pascals triangle.
func _ready():
	var new_pos = position/Vector2(192,96)
	value = val_from_pos(new_pos)
	if value < 1:
		$Label.text = "÷"+str(round(1.0/value*100.0)/100)
		$Sprite2D.modulate = "ff0000c8"
	elif value == 1:
		$Label.text = "×1"
		$Sprite2D.modulate = "ffff00c8"
	else:
		$Label.text = "×"+str(round(value*100.0)/100)
		$Sprite2D.modulate = "00ff00c8"
	#print(str(value)+" "+str(new_pos))

func val_from_pos(pos):
	return (nCr(pos.y,abs(pos.x))**1.8)/(nCr(pos.y,abs(pos.x)+(pos.y/2.0))**0.9)

func nCr(n, r) -> float:
	return factorial(n) / (factorial(r) * factorial(n - r))

func factorial(num : int):
	var result = 1
	for i in range(1, num+1):
		result *= i
	return result
