extends Area2D

@export var SPEED: int = 1000
var direction: Vector2 = Vector2.UP

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * SPEED * delta
