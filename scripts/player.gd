extends CharacterBody2D

var speed = 300.0
var jump_speed = -350.0
var jumpcount = 0

func _physics_process(delta):
		# Handle Jump.
	if is_on_floor():
		velocity.y = jump_speed
		jumpcount += 1
# Add the gravity.
	velocity += get_gravity() * delta


	# Get the input direction.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed
	if velocity.x != 0:
		$ball.flip_v = false
		$ball.flip_h = velocity.x < 0

	move_and_slide()
	

#the key
func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("key"):
		$keyhold.visible = true
		area.queue_free()
