extends CharacterBody3D

const SPEED := 100.0
const CHASE_RANGE := 4.0

@export var target: CharacterBody3D
@onready var nav_agent: NavigationAgent3D = $nav_agent


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	velocity = Vector3.ZERO
	if global_position.distance_to(target.global_position) < CHASE_RANGE:
		nav_agent.set_target_position(target.global_transform.origin)
		var next_nav_point = nav_agent.get_next_path_position()
		velocity = (next_nav_point - global_transform.origin).normalized() * SPEED * delta
		look_at(Vector3(target.global_position.x, global_position.y, target.global_position.z), Vector3.UP)
		
	move_and_slide()
