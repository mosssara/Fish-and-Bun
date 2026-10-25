extends Area2D


var secret_scene = load("res://scene/special.tscn")
var secret = secret_scene.instantiate()
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	pass	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_secret == true:
		Global.select_secret = false #boolean to check with grill
		Global.current_select = null
		Global.showstat()
		return
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed(): #check left click
		Global.select_bun = false #boolean to check with grill
		Global.select_meat = false
		Global.select_lettuce = false
		Global.select_secret = true
		Global.current_select = "Secret"

		
		Global.showstat()
		sprite_2d.modulate = Color("pink")
		Global.showstat()
		
func _process(delta: float) -> void:
	if Global.select_secret == false:
		sprite_2d.modulate = Color("white")
