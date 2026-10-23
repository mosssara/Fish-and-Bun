extends Node
var select_bun = false
var select_meat = false
var select_lettuce = false
var select_secret = false
func select_check(select1,select2,select3,select4):
	var result = (select1 or select2 or select3 or select4)
	return result

var grill1 = false # unoccupied

func _ready() -> void:
	pass # Replace with function body.
