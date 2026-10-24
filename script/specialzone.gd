extends Area2D


var secret_scene = load("res://scene/special.tscn")
var secret = secret_scene.instantiate()
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	pass	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) != true: #check left click
		Global.select_secret = true #boolean to check with grill
		Global.current_select = "Secret"

		
		Global.showstat()
		sprite_2d.modulate = Color("pink")
		Global.showstat()
		
func _process(delta: float) -> void:
	if Global.select_secret == false:
		sprite_2d.modulate = Color("white")
