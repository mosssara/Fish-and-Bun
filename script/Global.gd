extends Node
var select_bun = false
var select_meat = false
var select_lettuce = false
var select_secret = false
var current_select = null
var parent = null
var grill1 = false # unoccupied
var grill2 = false
var foodstack = [] #array to save food order etc bread/meat/meat etc
func select_check(select1,select2,select3,select4):
	var result = (select1 == true or select2 == true or select3 == true or select4 == true)
	return result

func showstat():
	print("bun ",Global.select_bun, "\nmeat ",Global.select_meat," \nlettuce ",Global.select_lettuce,"\nsecret",Global.select_secret,"\nCurrent select ",Global.current_select) 


func _ready() -> void:
	pass # Replace with function body.
