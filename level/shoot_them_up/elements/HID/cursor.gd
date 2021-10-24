extends Sprite

const IMAGE_PATH = "res://ressources/shoot_them_up/rocket_position.svg"

# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.new()
	var texture = ImageTexture.new()
	
	image.load(IMAGE_PATH)
	texture.create_from_image(image)
	
	self.texture = texture

func get_width():
	return self.texture.get_width()
	
func get_height():
	return self.texture.get_height()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
