extends KinematicBody2D
class_name WalkingEnemyy


const MIN_DIRECTION_CHANGE_DELAY = 1.5
const MAX_DIRECTION_CHANGE_DELAY = 5.0

export var SPEED = 50


var direction = Vector2.RIGHT
var velocity = Vector2.ZERO 
var direction_change_timer = 0.0

onready var ledgeCheckR: = $LedgeCheckRight
onready var ledgeCheckL: = $LedgeCheckLeft
onready var sprite: = $AnimatedSprite


 
func _physics_process(delta):
	velocity = direction.normalized() * SPEED * delta
	var collision = move_and_collide(velocity)
	if collision:
		direction = random_direction()
		direction_change_timer = rand_range(MIN_DIRECTION_CHANGE_DELAY, MAX_DIRECTION_CHANGE_DELAY)

	if direction_change_timer > 0.0:
		direction_change_timer -= delta
	else:
		direction = random_direction()
		direction_change_timer = rand_range(MIN_DIRECTION_CHANGE_DELAY, MAX_DIRECTION_CHANGE_DELAY)

func random_direction():
	var directions = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]
	return directions[randi() % directions.size()]


# Called when the node enters the scene tree for the first time.
#func _physics_process(delta):
#	var found_wall = is_on_wall()
#	var found_ledge = not ledgeCheckR.is_colliding() or not ledgeCheckL.is_colliding()
#
#	if found_wall: # or found_ledge:
##		direction *= -1
#		direction = random_direction()
#
#	sprite.flip_h = direction.x > 0
#
#	#sprite.play("walk")
#	velocity = direction * 25
#	velocity = move_and_slide(velocity, Vector2.UP)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


