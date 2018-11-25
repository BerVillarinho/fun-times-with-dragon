extends Control

# class member variables go here, for example:
onready var counter = $Counter/Label
onready var bar = $ProgressBar

func _ready():
	var player_max_health = $"../Player".life
	var dragon_max_energy = $"../Dragon".energy
	counter.text = str(player_max_health)
	update_health(player_max_health)
	update_energy(dragon_max_energy)

func update_health(new_value):
	counter.text = str(new_value)

func update_energy(new_value):
	bar.value = new_value

func _on_Player_life_changed(new_value):
	update_health(new_value)

func _on_Dragon_energy_changed(new_value):
	update_energy(new_value)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass