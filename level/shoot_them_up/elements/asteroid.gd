extends RigidBody2D

const SPEED_MIN = 0.01 # In °/s
const SPEED_MAX = 50.0 # In °/s
var speed = rand_range(SPEED_MIN, SPEED_MAX)

const SPRITE_NUM = 3 # asteroid_1/asteroid_2/asteroid_3
const SPRITE_PREFIX = "res://ressources/shoot_them_up/asteroid_"

# Called when the node enters the scene tree for the first time.
func _ready():	
	var image = Image.new()
	var texture = ImageTexture.new()
	var shape = CircleShape2D.new()
	
	linear_damp = 0
		
	image.load(
		SPRITE_PREFIX + str(
			# A randomly generated ID between 1 and SPRITE_NUM included
			(randi() % SPRITE_NUM) + 1
		) + ".png"
	)
	texture.create_from_image(image)
	
	get_node("CollisionShape2D/Sprite").texture = texture
	shape.radius = image.get_width()/2
	
	get_node("CollisionShape2D").shape = shape


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("CollisionShape2D/Sprite").rotation_degrees += speed * delta
	
	var vrect = get_viewport_rect()
	var rad = get_node("CollisionShape2D").shape.radius
	
	if (
		position.x < vrect.position.x - rad or
		position.y < vrect.position.y - rad or
		position.x > vrect.position.x + vrect.size.x + rad or
		position.y > vrect.position.y + vrect.size.y + rad
	):
		queue_free()
	
