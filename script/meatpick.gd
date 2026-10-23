extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D
var meat_scene = load("res://scene/meat.tscn")
var meat = meat_scene.instantiate()

func _ready() -> void:
	pass	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) != true: #check left click
		Global.select_meat = true #boolean to check with grill
		Global.current_select = "Meat"
		sprite_2d.set_modulate(Color.BLACK)
		
		Global.showstat()
func _process(delta: float) -> void:
	if Global.select_meat == false:
		sprite_2d.set_modulate(Color.WHITE)
