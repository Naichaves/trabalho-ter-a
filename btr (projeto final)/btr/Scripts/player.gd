extends CharacterBody2D


var speed = 160.0
var jump_velocity = -300.0
var jumps = 1


var dir

var gravity = 980

var is_alive = true

@export var left = "Left"
@export var right = "Right"
@export var jump = "Jump"

func _physics_process(delta: float) -> void:
	
	
	
	move(delta)
	
	if is_alive:
		animations()
	
	pass



func move(delta):
	
	if is_alive:
		dir = Input.get_axis(left , right)
	
	if dir:
		velocity.x = dir * speed 
	elif dir == 0:
		velocity.x = 0
	
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_alive:
		if Input.is_action_just_pressed(jump) and jumps > 0:
			velocity.y = jump_velocity
			jumps -= 1
	
	
	
	if is_on_floor():
		jumps = 1
		
	#if global_position.y > 346 and is_alive:
		#die()
	
	
	move_and_slide()
	
	pass

func animations():
	if velocity.x != 0 and is_on_floor():
		$AnimatedSprite2D.play("Run")
	elif velocity.x == 0 and is_on_floor():
		$AnimatedSprite2D.play("Idle")
	
	if not is_on_floor() and jumps >= 1:
		$AnimatedSprite2D.play("Jump")
	
	if dir > 0: 
		$AnimatedSprite2D.flip_h = false
	elif dir < 0:
		$AnimatedSprite2D.flip_h = true
	
	
	pass



func die():
	if is_alive:
	
		is_alive = false
	
		
		$AnimatedSprite2D.play ("Hit")
		
		$CollisionShape2D.queue_free()
		$Area2D.queue_free()
		velocity.y = jump_velocity
		camera_zoom()
		
		Global.score = 0
		#Global.dia = 0
		
		await get_tree().create_timer(1).timeout
		
		get_tree().reload_current_scene()
		
	
		pass
	
	
func camera_zoom():
	var zoom_value = 1.5
	
	$Camera2D.zoom = Vector2(zoom_value , zoom_value)
	Engine.time_scale = 0.5
	
	await get_tree().create_timer(0.8).timeout
	
	$Camera2D.zoom = Vector2(1 , 1 )
	Engine.time_scale = 1
	
	
	
	
	pass 
