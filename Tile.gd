extends Node2D

var depth = 0
var power = 0

func update_color():
	match int(round(depth)):
		0: $ColorRect.color = Color8(24,100,171)
		1: $ColorRect.color = Color8(34,139,230)
		2: $ColorRect.color = Color8(165,216,255)
		3: $ColorRect.color = Color8(73,80,87)
		4: $ColorRect.color = Color8(173,181,189)
		5: $ColorRect.color = Color8(43,138,62)
		6: $ColorRect.color = Color8(55,178,77)
		7: $ColorRect.color = Color8(81,207,102)
		8: $ColorRect.color = Color8(233,236,239)
		9: $ColorRect.color = Color8(241,243,245)
