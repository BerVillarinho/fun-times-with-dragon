extends KinematicBody2D

# class member variables go here, for example:
export (int) var speed = 0
var velocity = Vector2(0,0)

func _ready():
	get_node("notifier").connect("screen_exited", self, "_on_screen_exited")
	$AudioStreamPlayer2D.play()

func _process(delta):
	position += velocity * delta

func _on_Hurtbox_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
		
func _on_screen_exited():
    queue_free()