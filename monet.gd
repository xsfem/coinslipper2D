extends Node2D

@onready var anim_go: AnimatedSprite2D = $GoldEffect
@onready var anim_gr: AnimatedSprite2D = $GreenEffect
@onready var anim_pu: AnimatedSprite2D = $PurpleEffect

var collected := false

func _ready() -> void:
	anim_go.play("idle_gold")
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		
		collected = true
		result_score()
		
		anim_go.stop()
		
		if EndScore.score > 50:
			anim_pu.play("idle_purple")
			await anim_pu.animation_finished
		else:
			anim_gr.play("idle_green")
			await anim_gr.animation_finished
			
			
		queue_free()

func result_score():
	if EndScore.score > 50:
		EndScore.score += 2
	else:
		EndScore.score += 1
		
	print(EndScore.score)
