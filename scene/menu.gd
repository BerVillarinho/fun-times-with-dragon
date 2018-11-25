extends Control

func _input(event):
	var is_event_press = event is InputEventKey
	var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
	if (is_event_press and not event.echo) or is_other_press and event.pressed:
		Confirm.play()
		get_tree().change_scene("res://scene/game.tscn")
		queue_free()