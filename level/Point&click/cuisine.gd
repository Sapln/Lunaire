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


func _on_cuisine_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene		
		var node = get_tree().get_root()
		for i in node.get_children():
			node.remove_child(i)
			i.queue_free()
		node.add_child(load("res://level/dinette/dinette.tscn").instance())
		node.add_child(load("res://level/boutonRetour.tscn").instance())
		
	pass # Replace with function body.
