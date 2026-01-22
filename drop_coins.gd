extends Node

signal used

var cooldown := 2.0
var can_use := true
var points := 15

func use(player):
		if not can_use:
			return
		
		can_use = false
		
		#scpore change and health
		
		if EndScore.score == points or EndScore.score > points:
			#score change and health
			EndScore.score -= points
			player.health += 1
			
			#change_color
			player.anim.modulate = Color(0.846, 0.0, 0.245, 1.0)
			player.speed += 100
		
			emit_signal("used")
		
			#cooldown
			await get_tree().create_timer(cooldown).timeout
			#back default
			player.speed = 200
			player.anim.modulate = Color.WHITE
			
			can_use = true
			print(player.health)
		else:
			print("TI DOLBAEB = NET COINS")
			can_use = true
		
