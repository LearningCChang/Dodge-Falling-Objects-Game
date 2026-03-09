extends CharacterBody2D
# player.gd
# handles the little guy at the bottom who's trying not to get bonked

const SPEED = 400.0

# keeping track of the screen edges so we don't wander off into the void
var screen_size: Vector2

func _ready():
	screen_size = get_viewport_rect().size

func _physics_process(_delta):
	# figure out which way we're going
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		# not moving, slow down nice and quick
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	
	# clamp position so we stay on screen
	# the 25 is half our width, roughly
	position.x = clamp(position.x, 25, screen_size.x - 25)
