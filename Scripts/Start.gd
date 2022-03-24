extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	
	# Switch to Main menu
	get_tree().change_scene("res://Scenes/HomeScreen.tscn")
