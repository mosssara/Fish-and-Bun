extends Node2D
@onready var cooktime: Timer = $cooktime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var raw = 12 # 12 sec-time set is raw
var half = 6 # 6 sec to 11.999 sec is half
var cooked = 1 # 1-6 is cookes and less than 1 is burned

var bun_status = 1 # 1 = raw ,2 = half, 3 = cooked, 0 = burned
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooktime.start(15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooktime.get_time_left() >= raw:
		print(cooktime.get_time_left(),"raw")
		bun_status = 1
	elif cooktime.get_time_left() >= half:
		print(cooktime.get_time_left(),"half")
		bun_status = 2
	elif cooktime.get_time_left() >= cooked:
		print(cooktime.get_time_left(),"cooked")
		bun_status = 3
	else:
		print(cooktime.get_time_left(),"burned")
		bun_status = 0
	
	if Global.select_bun == false:
		animated_sprite_2d.set_modulate(Color.WHITE)
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: 
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret): #check left click #boolean to check with grill
		Global.select_bun = true #boolean to check with grill
		animated_sprite_2d.set_modulate(Color.BLACK)
