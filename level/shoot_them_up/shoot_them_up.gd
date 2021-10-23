extends Node2D

var asteroid = preload("res://level/shoot_them_up/elements/asteroid.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in range(100):
		var node = asteroid.instance()
		
		node.position.x = rand_range(32.0, 992.0)
		node.position.y = rand_range(32.0, 568.0)
		
		node.linear_velocity = Vector2(
			rand_range(-100, 100),
			rand_range(-10, 10)
		)
		
		add_child(node)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
