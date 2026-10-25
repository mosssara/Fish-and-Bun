extends Area2D

@onready var sprite_1: Sprite2D = $Sprite2D1
@onready var sprite_2: Sprite2D = $Sprite2D2
@onready var sprite_3: Sprite2D = $Sprite2D3
@onready var sprite_4: Sprite2D = $Sprite2D4
@onready var sprite_5: Sprite2D = $Sprite2D5
@onready var sprite_6: Sprite2D = $Sprite2D6
@onready var sad: AudioStreamPlayer = $sad
@onready var satisfy: AudioStreamPlayer = $satisfy

func getrect(id):
	match id:
		11:#BUN
			return Rect2(0,16,16,16)
		12:
			return Rect2(16,16,16,16)
		13:
			return Rect2(32,16,16,16)
		1:
			return Rect2(48,16,16,16)
		21:
			return Rect2(0,32,16,16)
		22:
			return Rect2(16,32,16,16)
		23:
			return Rect2(32,32,16,16)
		2:
			return Rect2(48,32,16,16)
		"Lettuce":
			return Rect2(0,48,16,16)
			
@onready var cooldown: Timer = $cooldown
func diff(ar1,ar2):
	var result
	if len(ar1) > len(ar2):
		result = len(ar1) - len(ar2)
	else:
		result = len(ar2)-len(ar1)
	return result
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func randomcat():
	var cat = randi_range(1,3)
	match cat:
		1:
			animated_sprite_2d.play("cat1")
		2:
			animated_sprite_2d.play("cat2")
		3:
			animated_sprite_2d.play("cat3")


func _ready() -> void:
	hide()
	cooldown.start(randi_range(15,25))
	
func order():
	randomcat()
	show()
	
	set_pickable(true)
	var foodnum =randi_range(3,6)
	print(foodnum)
	for i in range(0,foodnum):
		if i == 0 or i == foodnum-1:
			Global.cus2.append(13)
		else:
			Global.cus2.append(Global.foodlist.pick_random())
	for i in Global.cus2.size():
		layer = i
		match layer:
			0:
				sprite_1.show()
				sprite_1.set_region_enabled(true)
				sprite_1.region_rect = getrect(Global.cus2[0])
				sprite_1.global_position = Vector2(global_position[0]+60,global_position[1])
				print(getrect(Global.cus2[0]))
			1:
				sprite_2.show()
				sprite_2.set_region_enabled(true)
				sprite_2.region_rect = getrect(Global.cus2[1])
				sprite_2.global_position = Vector2(global_position[0]+60,global_position[1]-40)
				print(getrect(Global.cus2[1]))
			2:
				sprite_3.show()
				sprite_3.set_region_enabled(true)
				sprite_3.region_rect = getrect(Global.cus2[2])
				sprite_3.global_position = Vector2(global_position[0]+60,global_position[1]-80)
				print(getrect(Global.cus2[2]))
			3:
				sprite_4.show()
				sprite_4.set_region_enabled(true)
				sprite_4.region_rect = getrect(Global.cus2[3])
				sprite_4.global_position = Vector2(global_position[0]+60,global_position[1]-120)
				print(getrect(Global.cus2[3]))
			4:
				sprite_5.show()
				sprite_5.set_region_enabled(true)
				sprite_5.region_rect = getrect(Global.cus2[4])
				sprite_5.global_position = Vector2(global_position[0]+60,global_position[1]-160)
				print(getrect(Global.cus2[4]))
			5:
				sprite_6.show()
				sprite_6.set_region_enabled(true)
				sprite_6.region_rect = getrect(Global.cus2[5])
				sprite_6.global_position = Vector2(global_position[0]+60,global_position[1]-200)
				print(getrect(Global.cus2[5]))
	print(Global.cus2)
	
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		if Global.cus2 == Global.foodstack:# all correct 100% value
			Global.multiplier += len(Global.secret)*0.1
			Global.score += len(Global.foodstack)*5*Global.multiplier
			Global.money += len(Global.foodstack)*5*Global.multiplier
			satisfy.play()
		elif 1 in Global.foodstack or 2 in Global.foodstack or 11 in Global.foodstack or 21 in Global.foodstack: # something burn -0.2 multi and 80% value
			Global.multiplier -= 0.2
			Global.score += len(Global.foodstack)*4*Global.multiplier
			Global.money += len(Global.foodstack)*4*Global.multiplier
			sad.play()
		elif len(Global.foodstack) == 0: #pass 
			Global.multiplier -= 0.05
			sad.play()
		else: # something wrong but not burn
			Global.score += len(Global.foodstack)*4*Global.multiplier # 80%
			Global.money += len(Global.foodstack)*4*Global.multiplier # 80%
			Global.multiplier += len(Global.secret)*0.1
			sad.play()
		print("Score and multi:",Global.score, " ",Global.multiplier)
		Global.foodstack.clear()
		Global.secret.clear()
		Global.cus2.clear()
		hide()
		set_pickable(false)
		
		print(Global.foodstack)
		cooldown.start(randi_range(7,20))
		
		
func _on_cooldown_timeout() -> void:
	print("order")
	order()

var layer = 0


	
	
