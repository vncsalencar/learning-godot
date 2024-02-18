extends CharacterBody2D

const SPEED = 500.0

var can_laser: bool = true
var can_grenade: bool = true

signal laser(pos: Vector2, dir: Vector2)
signal grenade(pos: Vector2, dir: Vector2)

func _physics_process(delta):
	look_at(get_global_mouse_position())

	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * SPEED * delta
	move_and_slide()
	
	var dir = (get_global_mouse_position() - position).normalized()
	if Input.is_action_pressed("primary_action") and can_laser:
		var laser_markers = $LaserStart.get_children()
		var selected_marker = laser_markers.pick_random()
		can_laser = false
		laser.emit(selected_marker.global_position, dir)
		$CanLaserTimer.start()

	if Input.is_action_pressed("secondary_action") and can_grenade:
		can_grenade = false
		grenade.emit($GrenadeStart.global_position, dir)
		$CanGrenadeTimer.start()


func _on_can_laser_timer_timeout():
	can_laser = true


func _on_can_grenade_timer_timeout():
	can_grenade = true
