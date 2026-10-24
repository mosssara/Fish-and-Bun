extends Node
var select_bun = false
var select_meat = false
var select_fish = false
var select_lettuce = false
var select_secret = false
var current_select = null
var parent = null
var grill1 = false # unoccupied
var grill2 = false
var grill3 = false
var grill4 = false
var stack = 0
var foodstack = [] #array to save food order etc bread/meat/meat etc
var secret = []
var foodlist = [13,23,"Lettuce"]
var cus1 = []
var cus2 = []
var cus3 = []
var score = 100
var multiplier = 1
var money = 100
func select_check(select1,select2,select3,select4):
	var result = (select1 == true or select2 == true or select3 == true or select4 == true)
	return result

func showstat():
	print("bun ",Global.select_bun, "\nmeat ",Global.select_meat," \nlettuce ",Global.select_lettuce,"\nsecret",Global.select_secret,"\nCurrent select ",Global.current_select) 


func _ready() -> void:
	pass # Replace with function body.
