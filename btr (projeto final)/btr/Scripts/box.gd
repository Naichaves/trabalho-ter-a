extends RigidBody2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("Player"):
		var push_direction = area.get_parent().velocity.normalized()
		apply_impulse(push_direction * 100)
	
	pass # Replace with function body.
