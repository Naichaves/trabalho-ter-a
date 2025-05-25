extends Area2D


@export var obj = ""


@onready var item = get_parent().get_node(obj)


func _ready() -> void:
	
	
	pass



func _process(delta: float) -> void:
	
	
	
	pass


func _on_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("Player"):
		item.use()
	
	pass


func _on_area_exited(area: Area2D) -> void:
	
	if area.is_in_group("Player"):
		item.de_use()
	
	
	pass
