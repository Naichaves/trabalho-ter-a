extends Area2D

@export var scene= ""

var pegou_tudo = false

func _on_area_entered(area: Area2D) -> void:
	
	
	
	if area.is_in_group("Player") and pegou_tudo:
		
		await get_tree().create_timer(0.3).timeout
		
		Global.score = 0
		Global.dia = 0
		
		get_tree().change_scene_to_file(scene)
		
	
	pass 


func _ready() -> void:
	
	var qnt_dia = get_tree().get_nodes_in_group("Diamond").size()
	
	print(qnt_dia) 
	
	Global.dia = qnt_dia
	
	pass


func _process(delta: float) -> void:
	
	if Global.score >= Global.dia:
		pegou_tudo = true
	
	
	pass
