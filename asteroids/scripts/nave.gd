extends Node2D

var vel = 500;
var pre_tiro = preload("res://scenes/tiro.tscn")

func _ready():
	set_process(true)
	pass

func _process(delta):
	var d = 0
	var e = 0
	var c = 0
	var b = 0
	
	if Input.is_action_pressed("baixo"):
		b = 1
	if Input.is_action_pressed("cima"):
		c = -1
	if Input.is_action_pressed("esquerda"):
		e = -1
	if Input.is_action_pressed("direita"):
		d = 1
	
	if Input.is_action_pressed("giro_dir"):
		rotate(-0.1)
		#print(get_rot())
	if Input.is_action_pressed("giro_esq"):
		rotate(0.1)
		#print(get_rot())
	if Input.is_action_pressed("tiro"):
		var tiro = pre_tiro.instance()
		tiro.set_global_pos(get_global_pos())
		tiro.set_dir_x()
		tiro.set_dir_y()
		tiro.rotate(get_rot())
		get_node("../").add_child(tiro)
		pass
	set_pos(get_pos() + Vector2(vel*(e+d),vel*(c+b))*delta)	
	pass
