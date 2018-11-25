extends Control

# class member variables go here, for example:
var timer

func _ready():
	get_tree().paused = true
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(1)
	timer.set_one_shot(true)
	timer.start()
	pass
	
func _on_Timer_timeout():
	get_tree().paused = false
	queue_free()

#func _input(event):
#	var is_event_press = event is InputEventKey
#	var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
#	if (is_event_press and not event.echo) or is_other_press and event.pressed:
#		get_tree().paused = false
#		queue_free()