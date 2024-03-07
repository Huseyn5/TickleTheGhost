extends Node2D

var cursor = preload("res://Images/Feather-32.png")


func _input(event):
	if event is InputEventMouseButton:
		Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW,Vector2(20,20))

var seconds = 30

func _on_timer_timeout():
	if(seconds == 0):
		get_tree().change_scene_to_file("res://play_again_menu.tscn")
	elif(seconds > 10):
		seconds -= 1	
		$Timer_label.text = "0:" + str(seconds)
	else:
		seconds -= 1	
		$Timer_label.text = "0:0" + str(seconds)
	pass # Replace with function body.

func _physics_process(delta):
	$Score_label.text = str(get_node("Main Character").score)
	
