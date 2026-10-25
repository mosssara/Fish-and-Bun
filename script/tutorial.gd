extends Area2D
@onready var timer: Timer = $Timer


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == 1 and event.is_pressed() and timer.is_stopped() == true: #check left click
		get_tree().change_scene_to_file("res://scene/playarea.tscn")
