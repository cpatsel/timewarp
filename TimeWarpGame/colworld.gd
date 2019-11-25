extends Node2D

		
func _button_ladder_on(body, number):
	if body.is_in_group("player"):
		get_tree().call_group("ladder" + number, "set_deferred", "disabled", false)
		get_tree().call_group("ladder" + number, "show")


func _button_ladder_off(body, number):
	if body.is_in_group("player"):
		get_tree().call_group("ladder" + number, "set_deferred", "disabled", true)
		get_tree().call_group("ladder" + number, "hide")


func _button_door_on(body, number):
	if body.is_in_group("player"):
		get_tree().call_group("door" + number, "set_deferred", "disabled", false)
		get_tree().call_group("door" + number, "show")


func _button_door_off(body, number):
	if body.is_in_group("player"):
		get_tree().call_group("door" + number, "set_deferred", "disabled", true)
		get_tree().call_group("door" + number, "hide")


func _checkpoint_hit(body, number, left, top, right, bottom):
	if body.is_in_group("player"):
		get_tree().call_group("checkpoint" + number, "set_deferred", "disabled", true)
		get_tree().call_group("checkpoint" + number, "hide")
		get_tree().call_group("reset", "_anchor")
		get_tree().call_group("ghost", "_anchor")
		get_node("player/Camera2D2").limit_left = left
		get_node("player/Camera2D2").limit_top = top
		get_node("player/Camera2D2").limit_right = right
		get_node("player/Camera2D2").limit_bottom = bottom


