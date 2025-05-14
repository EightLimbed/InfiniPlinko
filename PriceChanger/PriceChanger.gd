extends Area2D

var value : float = 1


#it is n times more likely for a value to be in the middle two halfs. adjust multipliers accordingly
#Ranges between /10 and *10 (/10 in middles, *10 in outside). gradiant depends on layer of pascals triangle.
func _process(_delta):
	var new_pos = global_position/160
	value = val_from_pos(new_pos)
	print(value)
	if value < 1:
		$Label.text = "÷"+str(round(1/value*100)/100)
		$Sprite2D.modulate = "ff0000c8"
	elif value == 1:
		$Label.text = "×1"
		$Sprite2D.modulate = "ffff00c8"
	else:
		$Label.text = "×"+str(round(value*100)/100)
		$Sprite2D.modulate = "00ff00c8"

func val_from_pos(pos):
	#used quartic regression to return this from points (b,10),(b/2,1),(0,0.1),(-b/2,1),(-b,10)
	return (8.4*pos.x**4)/pos.y**4+(1.5*pos.x**2)/pos.y**2+0.1
