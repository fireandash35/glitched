extends Node2D

var blah = preload('res://enemy.tscn')

func _ready():
	var h = blah.instantiate()
	
	$Timer.start()




func _on_timer_timeout() -> void:
	var h = blah.instantiate()
	add_child(h)
	h.position = Vector2(
		randi_range(-100,100),
		randi_range(-100,100)
	)
