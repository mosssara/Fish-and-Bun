extends Node2D
@onready var sprite_1: Sprite2D = $Sprite2D1
@onready var sprite_2: Sprite2D = $Sprite2D2
@onready var sprite_3: Sprite2D = $Sprite2D3
@onready var sprite_4: Sprite2D = $Sprite2D4
@onready var sprite_5: Sprite2D = $Sprite2D5
@onready var sprite_6: Sprite2D = $Sprite2D6
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
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

var layer = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.secret.size() != 0:
		modulate = Color("purple")
	else:
		modulate = Color("white")
	if Global.foodstack.is_empty() == false:
		layer = Global.foodstack.size()-1
		match layer:
			0:
				sprite_1.show()
				sprite_1.set_region_enabled(true)
				sprite_1.region_rect = getrect(Global.foodstack[0])
				#print(getrect(Global.foodstack[0]))
			1:
				sprite_2.show()
				sprite_2.set_region_enabled(true)
				sprite_2.region_rect = getrect(Global.foodstack[1])
				sprite_2.global_position = Vector2(global_position[0],global_position[1]-10)
				#print(getrect(Global.foodstack[1]))
			2:
				sprite_3.show()
				sprite_3.set_region_enabled(true)
				sprite_3.region_rect = getrect(Global.foodstack[2])
				sprite_3.global_position = Vector2(global_position[0],global_position[1]-20)
				#print(getrect(Global.foodstack[2]))
			3:
				sprite_4.show()
				sprite_4.set_region_enabled(true)
				sprite_4.region_rect = getrect(Global.foodstack[3])
				sprite_4.global_position = Vector2(global_position[0],global_position[1]-30)
				#print(getrect(Global.foodstack[3]))
			4:
				sprite_5.show()
				sprite_5.set_region_enabled(true)
				sprite_5.region_rect = getrect(Global.foodstack[4])
				sprite_5.global_position = Vector2(global_position[0],global_position[1]-40)
				#print(getrect(Global.foodstack[4]))
			5:
				sprite_6.show()
				sprite_6.set_region_enabled(true)
				sprite_6.region_rect = getrect(Global.foodstack[5])
				sprite_6.global_position = Vector2(global_position[0],global_position[1]-50)
				#print(getrect(Global.foodstack[5]))
	else:
		sprite_1.set_region_enabled(true)
		sprite_1.region_rect = Rect2(0,0,0,0)
		sprite_2.region_rect = Rect2(0,0,0,0)
		sprite_3.region_rect = Rect2(0,0,0,0)
		sprite_4.region_rect = Rect2(0,0,0,0)
		sprite_5.region_rect = Rect2(0,0,0,0)
		sprite_6.region_rect = Rect2(0,0,0,0)
