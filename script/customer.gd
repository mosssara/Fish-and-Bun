extends Area2D

func _ready() -> void:
	var to =randi_range(3,5)
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		pass
