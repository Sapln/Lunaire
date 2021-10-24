extends Node2D

const Asteroid = preload("res://level/shoot_them_up/elements/asteroid.tscn")
const LifeCounter = preload("res://level/shoot_them_up/elements/HID/lifes.tscn")

const SPACESHIP_SPEED = 300
const SPAWN_DELAY = 0.5

const LEVEL_LENGTH = 180

var vie=3
var booleen=1
var last_spawn = 0
var timer = 0
var background = null
var is_finished = false
var _timer = null

func prepare_element(element, vrect, spaceship_speed):	
	var node = element.instance()
	
	var radius = node.gen_randomely(randi())
	
	node.linear_damp = 0
	
	node.linear_velocity = Vector2(
		rand_range(-50, 50),
		rand_range(-1, 1) + spaceship_speed
	)
	
	node.position.y = vrect.position.y - radius
	
	if node.linear_velocity.x > 0:
		node.position.x = rand_range(
			vrect.position.x,
			vrect.position.x + vrect.size.x/2
		)
	else:
		node.position.x = rand_range(
			vrect.position.x + vrect.size.x/2,
			vrect.position.x + vrect.size.x
		)
	
	return node

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AudioStreamPlayer.play()
	var vrect = get_viewport_rect()
	var texture = GradientTexture.new()
	background = get_node("Background")
	update_background_geometry(vrect)
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()

	
func update_background_geometry(vrect):
	background.position = vrect.position
	background.scale.y = vrect.size.x
	
	background.texture.width = vrect.size.y
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	last_spawn += delta
	timer += delta
	
	var vrect = get_viewport_rect()
	
	update_background_geometry(vrect)
	
	if last_spawn >= SPAWN_DELAY and booleen!=0:
		last_spawn = 0
		add_child(
			prepare_element(Asteroid, vrect, SPACESHIP_SPEED)
		)



func _on_Timer_timeout():
	if($moon.position.y<170):
		$moon.position.y +=2
		$HID/Position.achievement +=0.1
	else:
		$finished.visible = true
	
func game_over():
	vie-=1
	if vie<1:
		$AudioStreamPlayer.stop()
		get_tree().call_group("asteroide", "queue_free")
		booleen=0
