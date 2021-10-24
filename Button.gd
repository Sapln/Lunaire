extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var node = get_tree().get_root()
	for i in node.get_children():
		node.remove_child(i)
		i.queue_free()
	node.add_child(load("res://level/Point&click/point&click.tscn").instance())
	pass # Replace with function body.
