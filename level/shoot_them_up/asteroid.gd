extends RigidBody2D

const SPEED_MIN = 0.01 # In °/s
const SPEED_MAX = 50.0 # In °/s
var speed = rand_range(SPEED_MIN, SPEED_MAX)

const SPRITE_NUM = 3 # asteroid_1/asteroid_2/asteroid_3
const SPRITE_PREFIX = "res://ressources/shoot_them_up/asteroid_"

# Called when the node enters the scene tree for the first time.
func _ready():
	linear_damp = 0
	
	var image = Image.new()
	var texture = ImageTexture.new()
		
	image.load(
		SPRITE_PREFIX + str(
			# A randomly generated ID between 1 and SPRITE_NUM included
			(randi() % SPRITE_NUM) + 1
		) + ".png"
	)
	texture.create_from_image(image)
	
	get_node("CollisionShape2D/Sprite").texture = texture
	get_node("CollisionShape2D").shape.radius = image.get_width()/2


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vrect = get_viewport_rect()
	var rad = get_node("CollisionShape2D").shape.radius
	position.x = (
		int(position.x + rad - vrect.position.x) %
		int(vrect.size.x - vrect.position.x + 2*rad)
	) - rad + vrect.position.x 
	
	get_node("CollisionShape2D/Sprite").rotation_degrees += speed * delta
	
	
