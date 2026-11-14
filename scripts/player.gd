extends CharacterBody2D

var speed = 300.0
var jump_speed = -700.0

func _physics_process(delta):
	var Jump = ("ui_up")
		# Handle Jump.
	if Input.is_action_just_pressed(Jump) and is_on_floor():
		velocity.y = jump_speed
# Add the gravity.
	velocity += get_gravity() * delta


	# Get the input direction.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	move_and_slide()
