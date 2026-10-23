extends Area2D
var bun_scene = load("res://scene/bun.tscn")
var bun = bun_scene.instantiate()

@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	pass	

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_bun != true: #check left click
		Global.select_bun = true #boolean to check with grill
		
func _process(delta: float) -> void:
	if Global.select_bun == true:
		sprite_2d.set_modulate(Color.BLACK)
	else:
		sprite_2d.set_modulate(Color.WHITE)
