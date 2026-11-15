extends CharacterBody2D

var speed = 300.0
var jump_speed = -350.0

func _physics_process(delta):
	var Jump = ("ui_up")
		# Handle Jump.
	if is_on_floor():
		velocity.y = jump_speed
# Add the gravity.
	velocity += get_gravity() * delta


	# Get the input direction.
	var direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = direction * speed

	move_and_slide()
	


func _on_area_2d_area_entered(area: Area2D):
	if area.is_in_group("key"):
		$keyhold.visible = true
		area.queue_free()
