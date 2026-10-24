extends Node2D
@onready var cooktime: Timer = $cooktime
@onready var sprite_2d: Sprite2D = $Sprite2D

var raw = 13 # 13 sec-time set is raw
var half = 8 # 8 sec to 11.999 sec is half
var cooked = 1 # 1-8 is cookes and less than 1 is burned

var status = 11 # 1 = raw ,2 = half, 3 = cooked, 0 = burned
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cooktime.start(15)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cooktime.get_time_left() >= raw and cooktime.is_stopped() == false:
		#print(cooktime.get_time_left(),"raw")
		status = 11
		sprite_2d.region_rect = Rect2(0,16,16,16)
	elif cooktime.get_time_left() >= half and cooktime.is_stopped() == false:
		#print(cooktime.get_time_left(),"half")
		status = 12
		sprite_2d.region_rect = Rect2(16,16,16,16)
	elif cooktime.get_time_left() >= cooked and cooktime.is_stopped() == false:
		#print(cooktime.get_time_left(),"cooked")
		status = 13
		sprite_2d.region_rect = Rect2(32,16,16,16)
	else:
		#print(cooktime.get_time_left(),"burned")
		status = 1
		sprite_2d.region_rect = Rect2(48,16,16,16)

	
	if Global.select_bun == false:
		sprite_2d.set_modulate(Color.WHITE)
		
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: 
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) != true: #check left click
		print("CLICK")
		Global.current_select = get_node(get_path())
		Global.parent = get_parent()
		print(Global.current_select)
		Global.select_bun = true #boolean to check with grill
		sprite_2d.set_modulate(Color.BLACK)
		
		Global.showstat()


func _on_tree_exited() -> void:
	cooktime.set_paused(true)
