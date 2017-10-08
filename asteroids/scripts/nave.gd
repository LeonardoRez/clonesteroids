extends Node2D

var vel = 500;
var pre_tiro = preload("res://scenes/tiro.tscn")
var ultimo_tiro = 0
var intervalo_tiro = 0.3

func _ready():
	set_process(true)

func _process(delta):
	var d = 0
	var e = 0
	var c = 0
	var b = 0
	ultimo_tiro += delta
	if Input.is_action_pressed("cima"):
		c = 1
	
	if Input.is_action_pressed("giro_dir"):
		rotate(-0.1)
		c = 0
		#print(get_rot())
	if Input.is_action_pressed("giro_esq"):
		rotate(0.1)
		c = 0
		#print(get_rot())
	if Input.is_action_pressed("tiro"):
		if ultimo_tiro >= intervalo_tiro:
			var tiro = pre_tiro.instance()
			tiro.set_global_pos(get_global_pos())
			#tiro.set_dir_x()
			#tiro.set_dir_y()
			tiro.rotate(get_rot())
			get_node("../").add_child(tiro)
			ultimo_tiro = 0
		pass
	set_pos(get_pos() + Vector2(vel*(cos(get_rot()+PI/2)*c),vel*(sin(get_rot()+PI/2)*-c))*delta)
	pass
