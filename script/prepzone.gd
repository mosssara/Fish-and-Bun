extends Area2D
var bun_scene = load("res://scene/bun.tscn")
var Bun = bun_scene.instantiate()
var meat_scene = load("res://scene/meat.tscn")
var Meat = meat_scene.instantiate()
var lettuce_scene = load("res://scene/lettuce.tscn")
var Lettuce = lettuce_scene.instantiate()
var secret_scene = load("res://scene/special.tscn")
var Secret = secret_scene.instantiate()

var topper = null # most recent item on the burger
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and Global.select_check(Global.select_bun,Global.select_meat, Global.select_lettuce,Global.select_secret) == true:
		
		if Global.current_select is String and Global.stack != 0:
				if Global.current_select == "Lettuce":

					Global.foodstack.append("Lettuce")
					print(Global.foodstack)
					Global.stack += 1
					Global.current_select = null
					Global.select_lettuce = false
				elif Global.current_select == "Secret":
					if Global.secret.size() < 2:
						Global.secret.append("Secret")
					print(Global.secret)
					Global.current_select = null
					Global.select_secret = false
		elif Global.current_select is String and Global.stack == 0:
			Global.current_select = null
		else:
			match Global.parent.name:
				"grill1":
					Global.grill1 = false
					topper = Global.current_select.status
					Global.foodstack.append(topper)
					Global.current_select.queue_free()
					Global.current_select = null
					
				"grill2":
					Global.grill2 = false
					topper = Global.current_select.status
					Global.foodstack.append(topper)
					Global.current_select.queue_free()
					Global.current_select = null
					
				"grill3":
					Global.grill3 = false
					topper = Global.current_select.status
					Global.foodstack.append(topper)
					Global.current_select.queue_free()
					Global.current_select = null
					
				"grill4":
					Global.grill4 = false
					topper = Global.current_select.status
					Global.foodstack.append(topper)
					Global.current_select.queue_free()
					Global.current_select = null
			Global.stack += 1
			
			print(Global.foodstack)
			
			
		#need to write script to display the food stacking
		Global.select_bun = false
		Global.select_meat = false
		Global.select_lettuce = false
		Global.select_secret = false
		Global.current_select = null
		Global.showstat()
		
