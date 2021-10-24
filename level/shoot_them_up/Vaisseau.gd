extends Area2D

signal hit

export var speed = 200  # How fast the player will move (pixels/sec).
var screen_size  # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2.ZERO  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	
	if Input.is_action_pressed("ui_up"):
		velocity.y -= speed
	if Input.is_action_pressed("ui_down"):
		velocity.y += speed

	if velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position += velocity * delta
	position.x = clamp(position.x, 20, screen_size.x-40)
	position.y = clamp(position.y, 20, screen_size.y-40)
	$AnimatedSprite.animation = "vol"
	if velocity.x != 0:
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x < 0

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Vaisseau_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
