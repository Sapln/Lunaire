extends Node2D
enum {CAROTTE,CHAMPI,CITRON,COURGETTE,CUISSE,FROMAGE,LAIT,OEUF,OIGNON,ORANGE,POISSON,SALADE,TOMATE,VIANDE}

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
	var sprite = Sprite.new()
	var path = String()
	if (alim ==0):
		path = "res://ressources/dinette/carottes.png"
	elif (alim ==1):
		path = "res://ressources/dinette/champi.png"
	elif (alim ==2):
		path = "res://ressources/dinette/citron.png"
	elif (alim ==3):
		path = "res://ressources/dinette/courgette.png"
	elif (alim ==4):
		path = "res://ressources/dinette/cuisse.png"
	elif (alim ==5):
		path = "res://ressources/dinette/fromage.png"
	elif (alim ==6):
		path = "res://ressources/dinette/lait.png"
	elif (alim ==7):
		path = "res://ressources/dinette/oeufs.png"
	elif (alim ==8):
		path = "res://ressources/dinette/oignon.png"
	elif (alim ==9):
		path = "res://ressources/dinette/orange.png"
	elif (alim ==10):
		path = "res://ressources/dinette/poisson.png"
	elif (alim ==11):
		path = "res://ressources/dinette/salade.png"
	elif (alim ==12):
		path = "res://ressources/dinette/tomate.png"
	elif (alim ==13):
		path = "res://ressources/dinette/viande.png"
		
	sprite.texture = load(path)
	sprite.position.x = 400
	sprite.position.y = 300
	$ingredients.add_child(sprite)
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
		#for i in recette :
		#	print(i);
		plat_cuisine(recette)
		#reset
		recette = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
		var node = get_node("ingredients")
		for i in node.get_children():
			node.remove_child(i)
			i.queue_free()
	pass # Replace with function body.

#enum {CAROTTE,CHAMPI,CITRON,COURGETTE,CUISSE,FROMAGE,LAIT,OEUF,OIGNON,ORANGE,POISSON,SALADE,TOMATE,VIANDE}
func plat_cuisine(recette):
	var res = 1
	for i in range(len(recette)):
		if(recette[i] != 0):
			res *= recette[i]*i
	
	if(res == OEUF*2*CHAMPI*FROMAGE):
		print("omelette")
	elif(res == SALADE*TOMATE*CAROTTE or res == SALADE*TOMATE*OEUF):
		print("salade composee")
	pass

