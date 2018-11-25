extends Control

var block = true
var timer

func _ready():	
	BGMusic.play()
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.set_wait_time(0.5)
	timer.set_one_shot(true)
	timer.start()

func _input(event):
	if !block:
		var is_event_press = event is InputEventKey
		var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
		if (is_event_press and not event.echo) or is_other_press and event.pressed:
			Confirm.play()
			get_tree().change_scene("res://scene/game.tscn")
			queue_free()
		
func _on_Timer_timeout():
	block = false
