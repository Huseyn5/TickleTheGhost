extends CharacterBody2D

var freeze = false;
var score = 0;

func _physics_process(delta):
	var pos = get_viewport().get_mouse_position()
	var charpos = self.position
	var norm = sqrt((pos[0] - charpos.x) ** 2 + (pos[1] - charpos.y) ** 2)
	var direction = [(pos[0] - charpos.x), (pos[1] - charpos.y)]
	
	if (freeze == false):
		if(charpos.x < 256 && charpos.y > 471):
			velocity.x += 1500
			velocity.y -= 1500
		elif(charpos.x > 900 && charpos.y > 470):
			velocity.x -= 1500
		elif(charpos.x < 256 && charpos.y < 86):
			velocity.x += 1500
			velocity.y += 1500
		elif(charpos.x > 900 && charpos.y < 86):
			velocity.x -= 1500
	else:
		if(charpos.x < 256 && charpos.y > 471):
			velocity.x += 150
			velocity.y -= 150
		elif(charpos.x > 900 && charpos.y > 470):
			velocity.x -= 150
		elif(charpos.x < 256 && charpos.y < 86):
			velocity.x += 150
			velocity.y += 150
		elif(charpos.x > 900 && charpos.y < 86):
			velocity.x -= 150
	
	if(norm < 100 && freeze == false):
		velocity.x -= (1000/direction[0])
		velocity.y -= (1000/direction[1])
	elif(norm < 100 && freeze == true):
		velocity.x -= (50/direction[0])
		velocity.y -= (50/direction[1])
		
	if(freeze == true):
		velocity.x -= (1/(direction[0]*100))
		velocity.y -= (1/(direction[1]*100))
		
	
	move_and_slide();	

			
func _input(event):
	var pos = get_viewport().get_mouse_position()
	var charpos = self.position
	var norm = sqrt((pos[0] - charpos.x) ** 2 + (pos[1] - charpos.y) ** 2)
	var direction = [(pos[0] - charpos.x), (pos[1] - charpos.y)]
	if(event.is_action_pressed("LMC click") && norm < 50):
		print('h')
		$AnimatedSprite2D.play("default")	
		$Control/Laugh.play()
		$AnimatedSprite2D.play("default")
		score += int(500/norm)
		
func _on_freeze_timer_timeout():
	freeze = false


func _on_button_pressed():
	freeze = true
	$freeze_timer.start()
	
