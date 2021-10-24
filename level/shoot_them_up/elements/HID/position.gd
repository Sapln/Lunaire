extends Node2D

const LINE_WIDTH = 16

export(float) var height = 0 setget set_height
export(float) var achievement = 0 setget set_achievement

var _last_height = null
var _pos = 0
var _width = 0
var _init = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Remaining.size.x = LINE_WIDTH
	$Travalled.size.x = LINE_WIDTH

func init():
	_init = false
	
	_width = $Cursor.get_width()
	
	$Remaining.position.x = (_width - LINE_WIDTH) / 2
	$Travalled.position.x = (_width - LINE_WIDTH) / 2
	$Cursor.position.x = _width / 2

func set_height(v):
	height = v
	update()

func set_achievement(v):
	achievement = v
	update()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not _init: init()
	
	if _last_height != height:
		_last_height = height
		
		_pos = height * achievement
		
		$Remaining.size.y = height - _pos
		$Travalled.size.y = _pos
		
		$Travalled.position.y = $Remaining.size.y + $Remaining.position.y
		$Cursor.position.y = $Remaining.size.y + $Remaining.position.y
