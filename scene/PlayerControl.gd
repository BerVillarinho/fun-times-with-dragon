extends KinematicBody2D

const FLOOR_NORMAL = Vector2(0,-1)
const VERTICAL_SPEED = -1250
const GRAVITY_SPEED = -45

signal life_changed
signal died

# class member variables go here, for example:
var motion = Vector2()
var life = 3

func take_damage():
	Hit.play()
	life -= 1
	if life == 0:
		die()
	emit_signal("life_changed", life)

func die():
	get_tree().paused = true
	var deathscreen = preload("res://scene/DeathScreen.tscn").instance()
	get_parent().add_child(deathscreen)
	

func _input(event):
	var is_event_press = event is InputEventKey
	var is_other_press =  event is InputEventMouseButton or event is InputEventJoypadButton
	if (is_event_press and not event.echo) or is_other_press and event.pressed:
		if is_on_floor():
			JumpSound.play()
			motion.y = VERTICAL_SPEED
	elif is_event_press and not event.pressed:
			if motion.y < -45:
				motion.y = -45

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	motion.y -= GRAVITY_SPEED
	motion = move_and_slide(motion, FLOOR_NORMAL)
	pass