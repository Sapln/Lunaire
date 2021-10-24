extends CanvasLayer

const MARGIN = 8

var init = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init():
	init = true
	
	$LifeCounter.position.x = MARGIN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not init: init()
	var viewport = get_viewport()
	
	$LifeCounter.position.y = viewport.size.y - MARGIN - $LifeCounter.get_height()
	
	#$Position.set_height(viewport.size.y - 4*cursor_margins)
	$Position.set_height(viewport.size.y - $Position.get_total_margin())
	$Position.position.x = viewport.size.x - $Position.get_width()

func add_life():
	$LifeCounter.add_life()

func remove_life():
	$LifeCounter.remove_life()

func set_rocket_position(pos):
	$Position.set_achievement(pos)
