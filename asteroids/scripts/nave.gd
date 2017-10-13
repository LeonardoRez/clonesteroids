extends Node2D

export var rot_speed = 2.6
export var thrust = 500
export var max_vel = 400
export var friction = 0.65
#var vel            = 500;

#TIRO
var ultimo_tiro    = 0
var intervalo_tiro = 0.3
var pre_tiro       = preload("res://scenes/tiro.tscn")

#METERO
var meteoro        = preload("res://scenes/meteoro.tscn")
var screen_size = Vector2()
var rot         = 0
var pos         = Vector2()
var vel         = Vector2()
var acc         = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	pos = screen_size/2
	
	set_pos(pos)
	set_process(true)

func _process(delta):
		
	ultimo_tiro += delta
	if Input.is_action_pressed("tiro"):
		if ultimo_tiro >= intervalo_tiro:
			var tiro = pre_tiro.instance()
			print(get_global_pos())
			tiro.set_global_pos(get_global_pos())
			
			"""tiro.set_dir_x()
			#tiro.set_dir_y()"""
			tiro.rotate(get_rot())
			get_node("../").add_child(tiro)
			ultimo_tiro = 0
	if Input.is_action_pressed("giro_esq"):
		rot += rot_speed * delta	
	if Input.is_action_pressed("giro_dir"):
		rot -= rot_speed * delta
	if Input.is_action_pressed("cima"):
		acc = Vector2(thrust, 0).rotated(rot)
	else:
		acc = Vector2(0, 0)
	pass
	
#print(get_rot())
	acc += vel * -friction
	vel += acc * delta
	pos += vel * delta
	if pos.x > screen_size.width:
		pos.x = 0
	if pos.x < 0:
		pos.x = screen_size.width
	if pos.y > screen_size.height:
		pos.y = 0
	if pos.y < 0:
		pos.y = screen_size.height
	set_pos(pos)
		
	set_rot(rot - PI/2)	
	
	
	pass
