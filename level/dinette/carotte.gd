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

#CAROTTE = 0;
func _on_choix_carotte_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && get_parent().is_Fridge_Open :
		get_parent().add_Aliment(0);
	pass # Replace with function body.
