extends Control

# class member variables go here, for example:
# var a = 2
var unblock = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	Tada.play()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	var is_event_press = event is InputEventKey
	var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
	if (is_event_press and not event.echo) or is_other_press and event.pressed and $Timer.is_stopped() and unblock:
		Confirm.play()
		get_tree().paused = false
		get_tree().change_scene("res://scene/menu.tscn")
		queue_free()

func _on_Timer_timeout():
	unblock = true
