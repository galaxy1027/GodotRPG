extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer

func handle_input():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed
	
func player_animation():
	if velocity.x < 0: animations.play("walk_left")
	elif velocity.x > 0: animations.play("walk_right")
	elif velocity.y > 0: animations.play("walk_down")
	elif velocity.y < 0: animations.play("walk_up")
	else: animations.stop()
	
func _physics_process(delta):
	handle_input()
	move_and_slide()
	player_animation()
