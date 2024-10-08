extends Area2D
@export var move_speed = 300
@export var move_dir : Vector2

var star_pos : Vector2
var target_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	star_pos = global_position
	target_pos = star_pos + move_dir


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_pos, move_speed * delta)
	
	if global_position == target_pos:
		if global_position == star_pos:
			target_pos = star_pos + move_dir
		else:
			target_pos = star_pos




func _on_body_entered(body):
	if body.is_in_group("player"):
		body.game_over()

