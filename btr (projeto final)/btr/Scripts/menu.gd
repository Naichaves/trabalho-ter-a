extends Control




func _on_play_pressed() -> void:
	
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")

	
	
	pass 


func _on_quit_pressed() -> void:
	
	get_tree().quit()
	
	pass 
