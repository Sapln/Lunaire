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


func _on_openFridge_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && shape_idx != 1 && !get_parent().is_Fridge_Open:
		get_parent().change_Fridge_State();
		$ouvertureSprite.visible = false;
	#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		print("ouverture");
pass # Replace with function body.


func _on_closeFridge_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() && shape_idx == 1 && get_parent().is_Fridge_Open:
		get_parent().change_Fridge_State();
		$ouvertureSprite.visible = true;
		#var bulle = load("res://Controller/bulle_Plateforme.tscn").instance() #pour load une scene
		print("fermeture");
	pass # Replace with function body.

