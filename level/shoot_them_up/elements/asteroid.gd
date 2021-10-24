extends RigidBody2D

const SPEED_MIN = 0.10 # In °/s
const SPEED_MAX = 50.0 # In °/s
var speed = 0

const SPRITE_NUM = 3 # asteroid_1/asteroid_2/asteroid_3
const SPRITE_PREFIX = "res://ressources/shoot_them_up/asteroid_"

var generated = false

# Called when the node enters the scene tree for the first time.
func _ready():	
	if not generated:
		gen_randomely(randi())

func gen_randomely(rnd):
	var image = Image.new()
	var texture = ImageTexture.new()
	var shape = CircleShape2D.new()
		
	image.load(
		SPRITE_PREFIX + str(
			# A randomly generated ID between 1 and SPRITE_NUM included
			(rnd % SPRITE_NUM) + 1
		) + ".svg"
	)
	texture.create_from_image(image)
	
	get_node("CollisionShape2D/Sprite").texture = texture
	shape.radius = image.get_width()/2
	
	get_node("CollisionShape2D").shape = shape
	
	speed = rand_range(SPEED_MIN, SPEED_MAX)
	
	return shape.radius

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
	
