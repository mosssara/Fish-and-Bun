extends Area2D

var bun_scene = load("res://scene/bun.tscn")
var bun = bun_scene.instantiate()

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_bun == true and Global.grill1 == false:
		Global.select_bun = false
		Global.grill1 = true
		print("grill")
		add_child(bun)
		bun.global_position = global_position
