extends Node2D

var Tile = preload("res://Tile.tscn")
var Width = 102
var Height = 60
var s = 10
var map = []
export(float, 0, 50) var elevation = 25.0

func _ready():
	randomize()
	for w in range(Width):
		map.append([])
		map[w].resize(Height)
		for h in range(Height):
			var tile = Tile.instance()
			tile.position = Vector2(w*s, h*s)
			tile.power = floor(rand_range(0,10))
			tile.update_color()
			map[w][h] = tile
			add_child(tile)
	for depth in [9,8,7,6,5,4,3,2,1]:
		for w in range(Width):
			for h in range(Height):
				if map[w][h].power == depth:
					for hp in [-3,-2,-1,0,1,2,3]:
						for wp in [-3,-2,-1,0,1,2,3]:
							if h + hp >= 0 and h + hp < Height and w + wp >= 0 and w + wp < Width and map[w+wp][h+hp].depth < depth:
								var distance = sqrt(pow(float(hp),2) + pow(float(wp),2))
								var elevate = (depth/(distance+1))*(1.0/(51.0-elevation))
								map[w+wp][h+hp].depth += elevate
								map[w+wp][h+hp].depth = clamp(map[w+wp][h+hp].depth,0,9)
				map[w][h].update_color()
		yield(get_tree(), "idle_frame")

