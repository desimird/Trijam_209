extends KinematicBody2D
class_name Projectile

export(int) var MAX_SPEED = 250
export(int) var ACCELERATION = 200

onready var animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO
var knockback_vector = Global.projectile_knockback_vector
var direction = Global.projectile_dir

func _ready():
	#animated_sprite.flip_h = Global.projectile_dir < 0
	#MAX_SPEED = Global.projectile_dir * MAX_SPEED
	pass

func _process(delta):
	pass
	
func _physics_process(delta):
	velocity = velocity.move_toward(MAX_SPEED*direction, ACCELERATION * delta)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_wall():
		queue_free()
