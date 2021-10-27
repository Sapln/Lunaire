extends Node

var score=0
var time=0
export (PackedScene) var Monstres

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func new_game():
	$Music.play()
	$Lonk/AnimationPlayer.play("AnimLonk")
	score = 0
	time=0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$Hud/StartButton.hide()
	$Hud.update_score(score)
	$Hud.show_message("Get Ready")

func kirbo_die():
	score+=1
	$Hud.update_score(score)
	$KirboDie.play()

func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	time += 1
	$Hud.update_timer(time)

func _on_MobTimer_timeout():
	# Choose a random location on Path2D.
	$MobPath/MobSpawnLocation.offset = randi()
	# Create a Mob instance and add it to the scene.
	var mob = Monstres.instance()
	add_child(mob)
	# Set the mob's direction perpendicular to the path direction.
	var direction = $MobPath/MobSpawnLocation.rotation + PI / 2
	# Set the mob's position to a random location.
	mob.position = $MobPath/MobSpawnLocation.position
	# Add some randomness to the direction.
	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction
	# Set the velocity (speed & direction).
	mob.linear_velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = mob.linear_velocity.rotated(direction)


func game_over():
	$Music.stop()
	$Death.play()
	$ScoreTimer.stop()
	$MobTimer.stop()
	$Hud.show_game_over()
	get_tree().call_group("mobs", "queue_free")

func _on_Button_button_down():
	$Music.stop()
	$ScoreTimer.stop()
	$MobTimer.stop()
	get_tree().call_group("mobs", "queue_free")
	new_game()
