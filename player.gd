extends CharacterBody2D

var health = 100
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var damage = 30
var can = true
func _physics_process(delta: float) -> void:
	
	velocity = Vector2.ZERO
	if Input.is_action_pressed('w'):
		velocity.y = -SPEED 
	if Input.is_action_pressed('s'):
		velocity.y = SPEED
	if Input.is_action_pressed('a'):
		velocity.x = -SPEED
	if Input.is_action_pressed('d'):
		velocity.x = SPEED
	move_and_slide()

	for body in $Area2D.get_overlapping_bodies():
		if body.has_method('damage'):
			body.damage(damage)
func die(dam):
	if can:
		health -= dam
		can = false
		$Timer.start()
	if health <= 0:
		get_tree().reload_current_scene()


func _on_timer_timeout() -> void:
	can = true
