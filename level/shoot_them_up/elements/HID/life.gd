extends Sprite

const IMAGE_PATH = "res://ressources/shoot_them_up/rocket_life.svg"

# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.new()
	var texture = ImageTexture.new()
	
	image.load(IMAGE_PATH)
	texture.create_from_image(image)
	
	self.texture = texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
