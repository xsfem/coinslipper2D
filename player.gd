extends CharacterBody2D

const JUMP_VELOCITY = -400.0

@onready var anim = $AnimatedSprite2D

var health := 3
var speed = 200.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
		anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		anim.play("idle")
	
	move_and_slide()


func _input(event: InputEvent) -> void:
	#drop_coin -15 = +1 health
	if event.is_action_pressed("drop_coin"):
		$skills_manager/drop_coins.use(self)
