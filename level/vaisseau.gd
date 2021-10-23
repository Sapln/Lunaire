extends Area2D

var i = 0;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_vaisseau_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed():
		#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		print("clic vaisseau");
		print(i);
		i = i+1
	pass # Replace with function body.
