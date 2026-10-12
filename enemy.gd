extends CharacterBody2D
var body:Node2D
var can_damage = true
var health = 100
var direction = null
var dama = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	body = get_tree().get_first_node_in_group('player')
	
	direction = global_position.direction_to(body.global_position)
	
	velocity = direction * 200
	
	move_and_slide()
	
	for body in $Area2D.get_overlapping_bodies():
		if body.has_method('die'):
			body.die(dama)
func damage(dam):
	if can_damage:
		health -= dam
		can_damage = false
		$Timer.start()
		
	if health <= 0:
		queue_free()


func _on_timer_timeout() -> void:
	can_damage = true
