extends Area2D

signal hit

export var speed = 200  # How fast the player will move (pixels/sec).
export var jump_speed=500
export var gravite =60
var screen_size  # Size of the game window.
var velocity = Vector2.ZERO  # The player's movement vector.

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	pass # Replace with function body.

func _process(delta):
	velocity.x=0
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	
	if position.y>558:
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = -jump_speed
		else:
			velocity.y=0
	if position.y<400:
		velocity.y= gravite*delta
		velocity.y = velocity.y * jump_speed

	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 20, screen_size.x-40)
	position.y = clamp(position.y, 20, screen_size.y-40)
	if velocity.x != 0:
		$AnimatedSprite.animation = "marcher"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite.animation = "sauter"

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


