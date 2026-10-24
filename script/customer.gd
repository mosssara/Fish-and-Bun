extends Area2D
func diff(ar1,ar2):
	var result
	if len(ar1) > len(ar2):
		result = len(ar1) - len(ar2)
	else:
		result = len(ar2)-len(ar1)
	return result

@onready var cooldown: Timer = $Cooldown
	
func _ready() -> void:
	order()
	
func order():
	show()
	set_pickable(true)
	var foodnum =randi_range(3,6)
	print(foodnum)
	for i in range(0,foodnum):
		if i == 0 or i == foodnum-1:
			Global.cus1.append(13)
		else:
			Global.cus1.append(Global.foodlist.pick_random())
	print(Global.cus1)
	
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		if Global.cus1 == Global.foodstack:# all correct 100% value
			Global.multiplier += len(Global.secret)*0.1
			Global.score += len(Global.foodstack)*5*Global.multiplier
			Global.money += len(Global.foodstack)*5*Global.multiplier
		elif 0 in Global.foodstack or 11 in Global.foodstack or 21 in Global.foodstack: # something burn -0.2 multi and 80% value
			Global.multiplier -= 0.2
			Global.score += len(Global.cus1)*4*Global.multiplier
			Global.money += len(Global.secret)*0.1
		elif len(Global.foodstack) == 0: #pass 
			Global.multiplier -= 0.1 

		else: # something wrong but not burn
			Global.score += len(Global.foodstack)*4*Global.multiplier # 80%
			Global.multiplier += len(Global.secret)*0.1
			
		print("Score and multi:",Global.score, " ",Global.multiplier)
		Global.foodstack.clear()
		Global.secret.clear()
		Global.cus1.clear()
		hide()
		set_pickable(false)
		
		print(Global.foodstack)
		cooldown.start(randi_range(2,8))
		
		

func _on_cooldown_timeout() -> void:
	order()
