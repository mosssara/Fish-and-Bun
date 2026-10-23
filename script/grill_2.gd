extends Area2D

var bun_scene = load("res://scene/bun.tscn")
var meat_scene = load("res://scene/meat.tscn")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) == true and Global.grill2 == false:
		
		var bun = bun_scene.instantiate()
		var meat = meat_scene.instantiate()
		print(Global.current_select)
		match Global.current_select:
			"Bun":
				add_child(bun)
				bun.global_position = global_position
				print("BUNNNNNNNNNNN")
			"Meat":
				add_child(meat)
				meat.global_position = global_position
				print("MEATTTTTTTTTT")
		Global.current_select = null
		Global.select_bun = false
		Global.select_meat = false
		Global.grill2 = true
		print("grill")
		Global.showstat()
