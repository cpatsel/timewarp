extends Node2D


func _on_princess_body_enter(body):
    # The name of this editor-generated callback is unfortunate
    if body.is_in_group("player"):
        $youwin.show()
		
func _on_button1_body_entered(body):
	if body.is_in_group("player"):
		$youwin2.show()
		get_tree().call_group("ladder1", "set_deferred", "disabled", false)
		get_tree().call_group("ladder1", "show")


func _on_button2_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_group("door1", "set_deferred", "disabled", true)
		get_tree().call_group("door1", "hide")
		$youwin2.hide()


func _on_button3_body_entered(body):
	if body.is_in_group("player"):
		get_tree().call_group("door2", "set_deferred", "disabled", true)
		get_tree().call_group("door2", "hide")
		$youwin.hide()
