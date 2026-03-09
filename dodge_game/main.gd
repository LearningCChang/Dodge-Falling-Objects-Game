extends Node2D
# main.gd
# runs the show, spawns rocks, keeps score, all that good stuff

@onready var score_label = $UI/ScoreLabel
@onready var message_label = $UI/MessageLabel
@onready var spawn_timer = $SpawnTimer
@onready var difficulty_timer = $DifficultyTimer

var rock_scene = preload("res://rock.tscn")

var score: int = 0
var is_game_over: bool = false
var current_spawn_time: float = 1.0
var current_rock_speed: float = 200.0

func _ready():
	# add ourselves to the main group so rocks can tell us when bad things happen
	add_to_group("main")
	
	# hide the game over message until we actually lose
	message_label.visible = false
	
	# kick things off
	spawn_timer.wait_time = current_spawn_time
	spawn_timer.start()
	difficulty_timer.start()

func _process(_delta):
	# score goes up over time as long as you're alive
	# feels good to see numbers go up
	if not is_game_over:
		score += 1
		score_label.text = "Score: " + str(score)
	
	# restart on space after game over
	if is_game_over and Input.is_action_just_pressed("ui_accept"):
		get_tree().reload_current_scene()

func spawn_rock():
	if is_game_over:
		return
	
	var rock = rock_scene.instantiate()
	
	# spawn somewhere random along the top
	# leave a little margin on the sides
	rock.position = Vector2(randf_range(30, 450), -50)
	rock.fall_speed = current_rock_speed
	
	add_child(rock)

func game_over():
	# called by rocks when they hit the player
	is_game_over = true
	spawn_timer.stop()
	difficulty_timer.stop()
	
	message_label.text = "Game Over!\nScore: " + str(score) + "\n\nPress Space to restart"
	message_label.visible = true

func _on_spawn_timer_timeout():
	spawn_rock()

func _on_difficulty_timer_timeout():
	# make things gradually harder
	# spawn faster and rocks fall quicker
	# but don't go too crazy or it becomes impossible
	
	if current_spawn_time > 0.3:
		current_spawn_time -= 0.05
		spawn_timer.wait_time = current_spawn_time
	
	if current_rock_speed < 500:
		current_rock_speed += 20
