extends Area2D
# rock.gd
# these are the things falling from the sky that you really don't want to touch

var fall_speed: float = 200.0

func _ready():
	# connect the body entered signal so we know when we hit something
	body_entered.connect(_on_body_entered)

func _process(delta):
	# just fall straight down, nothing fancy
	position.y += fall_speed * delta
	
	# if we've fallen off the bottom of the screen, delete ourselves
	# no point keeping track of rocks nobody can see
	if position.y > 800:
		queue_free()

func _on_body_entered(body):
	# did we hit the player? that's bad news for them
	if body.is_in_group("player"):
		# let the main scene know someone got bonked
		get_tree().call_group("main", "game_over")
