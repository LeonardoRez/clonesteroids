extends Node2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65

var screen_size = Vector2()
var rot = 0
var pos = Vector2()
var vel = Vector2()
var acc = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	pos = screen_size / 2
	set_pos(pos)
	set_process(true)

func _process(delta):
	var d = 0
	var e = 0
	var c = 0
	var b = 0
	
	if Input.is_action_pressed("cima"):
		c = 1

#	if Input.is_action_pressed("esquerda"):
#		e = -1
#	if Input.is_action_pressed("direita"):
#		d = 1
#	if Input.is_action_pressed("baixo"):
#		b = 1
	
	if Input.is_action_pressed("giro_dir"):
		rotate(-0.1)
		c = 0
		#print(get_rot())
	if Input.is_action_pressed("giro_esq"):
		rotate(0.1)
		c = 0
		#print(get_rot())
	if Input.is_action_pressed("tiro"):
		var tiro = pre_tiro.instance()
		tiro.set_global_pos(get_global_pos())
		#tiro.set_dir_x()
		#tiro.set_dir_y()
		tiro.rotate(get_rot())
		get_node("../").add_child(tiro)
		pass
	set_pos(get_pos() + Vector2(vel*(cos(get_rot()+PI/2)*c),vel*(sin(get_rot()+PI/2)*-c))*delta)
	pass
