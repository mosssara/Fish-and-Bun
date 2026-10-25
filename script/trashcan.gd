extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.current_select == null:
		Global.foodstack.clear()
		Global.secret.clear()
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) == true:
		
		if Global.current_select is String:
			Global.current_select = null
		elif Global.current_select != null:
			match Global.parent.name:
				"grill1":
					Global.grill1 = false
				"grill2":
					Global.grill2 = false
				"grill3":
					Global.grill3 = false
				"grill4":
					Global.grill4 = false
			print(Global.current_select)
			Global.current_select.free()
			Global.current_select = null
		
		Global.select_bun = false
		Global.select_meat = false
		Global.select_lettuce = false
		Global.select_secret = false
		Global.showstat()
