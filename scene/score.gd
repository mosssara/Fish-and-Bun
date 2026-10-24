extends Control
@onready var display: Label = $display
@onready var button: Button = $Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display.text = "SCORE\n"+str(Global.score)
	Global.current_select = null
	Global.parent = null
	Global.grill1 = false # unoccupied
	Global.grill2 = false
	Global.grill3 = false
	Global.grill4 = false
	Global.stack = 0
	Global.foodstack = [] #array to save food order etc bread/meat/meat etc
	Global.secret = []
	Global.foodlist = [23,"Lettuce"]
	Global.cus1 = []
	Global.cus2 = []
	Global.cus3 = []
	Global.score = 100
	Global.multiplier = 1
	Global.money = 100
func select_check(select1,select2,select3,select4):
	var result = (select1 == true or select2 == true or select3 == true or select4 == true)
	return result

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/Menu.tscn")
