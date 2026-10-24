extends Node2D
@onready var multi_counter: Timer = $multi_counter
@onready var score_counter: Timer = $score_counter
var x = 1
var y = 0.01
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timermoney_start()
	timerscore_start()


func timermoney_start():
	score_counter.start(5)

func timerscore_start():
	multi_counter.start(7)

func _on_score_counter_timeout() -> void:
	print("TIME REACH")
	Global.money -= x
	x += 0.3
	timermoney_start()


func _on_multi_counter_timeout() -> void:
	"multi down"
	Global.multiplier -= y
	timerscore_start()
var score
func _process(delta: float) -> void:
	if Global.multiplier <= 0 or Global.multiplier > 1.5 or Global.money <= 0:
		score = Global.score
		get_tree().change_scene_to_file("res://scene/score.tscn")
