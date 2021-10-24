extends Area2D

onready var anim=$AnimationPlayer


func attack():
	get_parent().get_node("AnimatedSprite").play("attaquer")

func _on_Weapon_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()
