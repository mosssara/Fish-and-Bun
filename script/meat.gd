extends Node2D
@onready var cooktime: Timer = $cooktime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var raw = 10 # 12 sec-time set is raw
var half = 5 # 6 sec to 11.999 sec is half
var cooked = 0.5 # 1-6 is cookes and less than 1 is burned

var status = 21 # 1 = raw ,2 = half, 3 = cooked, 0 = burned
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooktime.start(15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooktime.get_time_left() >= raw and cooktime.is_stopped() == false:
		print(cooktime.get_time_left(),"raw")
		status = 21
		
	elif cooktime.get_time_left() >= half and cooktime.is_stopped() == false:
		print(cooktime.get_time_left(),"half")
		status = 22
	elif cooktime.get_time_left() >= cooked and cooktime.is_stopped() == false:
		print(cooktime.get_time_left(),"cooked")
		status = 23
	else:
		print(cooktime.get_time_left(),"burned")
		status = 0

	if Global.select_meat == false:
		animated_sprite_2d.set_modulate(Color.WHITE)
		
	if Global.grill1 == false:
		cooktime.set_paused(true)
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: 
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) != true: #check left click
		Global.current_select = get_node(get_path())
		print("path: "+Global.current_select)
		Global.parent = get_parent()
		print(Global.current_select)
		Global.select_meat = true #boolean to check with grill
		animated_sprite_2d.set_modulate(Color.BLACK)
		
		Global.showstat()
