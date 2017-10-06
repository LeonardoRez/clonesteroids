extends Node2D

var vel = 500
var dir_x = 0
var dir_y = 0

func _ready():
	set_process(true)
	
	pass
func set_dir_x(x_temp):
	dir_x = x_temp
	pass
func set_dir_y(y_temp):
	dir_y = y_temp
	pass
func _process(delta):
	set_pos( get_pos() + Vector2( dir_x * vel , dir_y * vel ) * delta )
	if get_pos().x < 30 or get_pos().x > 930:
		queue_free()
	if get_pos().y < 30 or get_pos().y > 930:
		queue_free()
	
	pass