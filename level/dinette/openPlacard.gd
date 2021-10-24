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


func _on_openPlacard_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && shape_idx != 1 && !get_parent().is_Placard_Open:
		get_parent().change_Placard_State();
		$ouverturePSprite.visible = false;
	#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		print("ouverture");
	pass


func _on_closePlacard_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && shape_idx == 1 && get_parent().is_Placard_Open:
		get_parent().change_Placard_State();
		$ouverturePSprite.visible = true;
		#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		print("fermeture");
	pass # Replace with function body.
