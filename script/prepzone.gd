extends Area2D

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) == true:
		
		if Global.current_select is String:
				if Global.current_select == "Lettuce" or Global.current_select == "Secret":
					Global.foodstack.append(Global.current_select)
				print(Global.foodstack)
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
			Global.foodstack.append(Global.current_select.status)
			print(Global.current_select.name)
			print(Global.foodstack)
			Global.current_select.free()
				
		#need to write script to display the food stacking
		Global.select_bun = false
		Global.select_meat = false
		Global.select_lettuce = false
		Global.select_secret = false
		Global.current_select = null
		Global.showstat()
		
