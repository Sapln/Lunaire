extends Node2D
enum {CAROTTE,LAIT,OEUF,TOMATE,ORANGE,CITRON,POISSON,VIANDE,CUISSE,COURGETTE,OIGNON,FROMAGE,SALADE,CHAMPI}

var recette = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
var is_Fridge_Open = false;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func add_Aliment(alim):
	recette[alim] +=1;
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func change_Fridge_State():
	is_Fridge_Open = !is_Fridge_Open;
	pass;



func _on_poele_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.is_pressed() :
		print("Cuisine");
		for i in recette :
			print(i);
		recette = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	pass # Replace with function body.
