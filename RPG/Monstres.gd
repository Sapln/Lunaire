extends RigidBody2D

export var min_speed = 150  # Minimum speed range.
export var max_speed = 250  # Maximum speed range.

func _ready():
	var mob_types = $AnimatedSprite.frames.get_animation_names()
	#$AnimatedSprite.animation = mob_types[randi() % mob_types.size()]
	$AnimatedSprite.animation = "voler"

func _on_VisibilityNotifier2D_screen_exited():
	$KirboDie.play()
	yield(get_tree().create_timer(1),"timeout")
	queue_free()

func handle_hit():
	print("gnéééééé")
	queue_free()
