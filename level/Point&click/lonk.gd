extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_lonk_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		#get_tree().get_root().add_child(load("res://level/shoot_them_up/shoot_them_up.tscn").instance())
		var node = get_tree().get_root()
		for i in node.get_children():
			node.remove_child(i)
			i.queue_free()
		print("lonk")
		node.add_child(load("res://level/boutonRetour.tscn").instance())
	pass # Replace with function body.
