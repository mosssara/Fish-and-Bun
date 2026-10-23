extends Node2D
@onready var cooktime: Timer = $cooktime
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.select_bun == false:
		animated_sprite_2d.set_modulate(Color.WHITE)
		
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: 
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) != true: #check left click
		print("CLICK")
		Global.current_select = "Lettuce"
		Global.parent = get_parent()
		print(Global.current_select)
		Global.select_lettuce = true #boolean to check with grill
		animated_sprite_2d.set_modulate(Color.BLACK)
		
		Global.showstat()
