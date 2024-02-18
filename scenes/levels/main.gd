extends Node2D

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()

func _on_gate_player_entered_gate(body: Node2D):
	pass # Replace with function body.

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_laser(laser_position, dir):
	var laser: Area2D = laser_scene.instantiate()
	laser.position = laser_position
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	laser.direction = dir
	$Projectiles.add_child(laser)

func _on_player_grenade(grenade_position, dir):
	var grenade: RigidBody2D = grenade_scene.instantiate()
	grenade.position = grenade_position
	grenade.linear_velocity = dir * grenade.speed
	$Projectiles.add_child(grenade)

