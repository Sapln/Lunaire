extends Area2D

onready var anim=$AnimationPlayer
var x
var y

func attack():
	get_parent().get_node("AnimatedSprite").play("attaquer")
	anim.play("New Anim")

func _on_Weapon_body_entered(body):
	if body.has_method("handle_hit"):
		x=get_parent().position.x
		y=get_parent().position.y
		body.handle_hit(x,y)
