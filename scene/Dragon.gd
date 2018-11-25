extends Node2D

signal energy_changed
signal tired

var energy = 100

func _ready():
	$Fire.set_wait_time(0.45)
	$Fire.set_one_shot(false) # Make sure it loops
	$Fire.start()
	pass
	
func _on_Fire_timeout():
	#$Fire.stop()
	#var rand = rand_range(1, 4)
	#for i in range(rand):
	open_jaw()
	fire()
	energy_tick()
	#$Fire.start()

func fire():
	var bullet = preload("res://scene/Bullet.tscn").instance()
	var player = get_node("../Player")
	bullet.position = $Mouth.global_position
	bullet.velocity = Vector2(800, 800) * (player.position - bullet.position).normalized()
	get_parent().add_child(bullet)

func energy_tick():
	energy -=2
	if energy== 0:
		tired()
	emit_signal("energy_changed", energy)

func tired():
	get_tree().paused = true
	var winscreen = preload("res://scene/Victory.tscn").instance()
	get_parent().add_child(winscreen)

func open_jaw():
	if($Jaw.is_stopped()):
		$head.rotation += 0.01
		$mandible.position += Vector2(1, -0.5)
		$mandible.rotation -= 0.1
		$Jaw.start()
	
func _on_Jaw_timeout():
	$head.rotation -= 0.01
	$mandible.position -= Vector2(1, -0.5)
	$mandible.rotation += 0.1
	$Jaw.stop()

