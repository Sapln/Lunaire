extends Node2D

const LifeSprite = preload("res://level/shoot_them_up/elements/HID/life.gd")

const FONT_PATH = "res://ressources/Xolonium-Regular.ttf"

const DEFAULT_LIFES = 3
const MAX_LIFES = 4

const SPRITE_MARGIN = 2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var count = DEFAULT_LIFES
var sprites = []

var counter_sprite = LifeSprite.new()
var counter_text   = null

var updated = false
var need_init = true

# Called when the node enters the scene tree for the first time.
func _ready():	
	counter_sprite.position.x = SPRITE_MARGIN
	counter_sprite.position.y = SPRITE_MARGIN
	counter_sprite.centered = false
	counter_sprite.visible = false
	
	counter_text =  get_node("Counter")
	
	counter_text.visible = false
	
	add_child(counter_sprite)
	add_child(counter_text)
	
	for i in range(0, MAX_LIFES):
		var to_add = LifeSprite.new()
		to_add.visible = (i < count)
		to_add.centered = false
		sprites.append(to_add)
		add_child(to_add)

func init():
	need_init = false
	counter_text.rect_size = Vector2(
		2*counter_sprite.texture.get_width() + SPRITE_MARGIN,
		counter_sprite.texture.get_height()
	)
	counter_text.rect_position = Vector2(
		counter_sprite.texture.get_width() + 2*SPRITE_MARGIN,
		SPRITE_MARGIN
	)
	
	var left = SPRITE_MARGIN
	
	for i in range(0, MAX_LIFES):
		sprites[i].position = Vector2(left, SPRITE_MARGIN)
		left += SPRITE_MARGIN + sprites[i].texture.size.x

func refresh():
	updated = true
	if count <= MAX_LIFES:
		for i in range(0, MAX_LIFES):
			sprites[i].visible = (i < count)
		counter_sprite.visible = false
		counter_text.visible = false
	else:
		for i in sprites:
			i.visible = false
		counter_sprite.visible = true
		counter_text.visible = true
		counter_text.text = "x %d" % count

func add_life():
	count += 1
	updated = false

func remove_life():
	if count == 0: return
	count -= 1
	updated = false

func is_dead():
	return count == 0

func get_height():
	return counter_text.rect_size.y + 2*SPRITE_MARGIN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if need_init: init()
	if not updated: refresh()
