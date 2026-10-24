extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var display = ""
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	display = "Multiplier: "+str(Global.multiplier)+"\nScore: "+str(Global.score)+"\nBalance: "+str(Global.money)
	text = display
