extends CharacterBody2D


const SPEED = 650
const JUMP_VELOCITY = -1000

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 4500


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		
		if direction > 0:
			$AnimatedSprite2D.play("walk_right")
		else:
			$AnimatedSprite2D.play("walk_left")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():  # Only play stand animation when on the ground
			$AnimatedSprite2D.play("stand")

	move_and_slide()
