extends Button


# Called when the node enters the scene tree for the first time.


func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass # Replace with function body.


func _on_quit_btn_pressed():
	get_tree().quit()
	pass # Replace with function body.