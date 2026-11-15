extends Area2D

var speed = 50.0
var moving = false
var player

func _ready():
	player = get_tree().current_scene.find_child("Player", true, false)
	body_entered.connect(_on_body_entered)

func _process(delta):
	if not moving and player.get_node("keyhold").visible:
		moving = true

	if moving:
		position.y += speed * delta

func _on_body_entered(body):
	if body.name == "Player":
		var main_scene = ProjectSettings.get_setting("application/run/main_scene")
		get_tree().call_deferred("change_scene_to_file", main_scene)
