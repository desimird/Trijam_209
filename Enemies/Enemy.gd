extends KinematicBody2D
class_name WalkingEnemy


const MIN_DIRECTION_CHANGE_DELAY = 1.5
const MAX_DIRECTION_CHANGE_DELAY = 5.0

export var SPEED = 50


var direction = Vector2.RIGHT
var direction_change_timer = 0.0

export(int) var MAX_SPEED = 10
#export(PackedScene) var tin_can 

onready var soft_collition = $SoftCollition
onready var stats = $Stats
onready var enemy_hurtbox = $EnemyHurtbox
onready var animated_sprite = $AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal instance_node(node, location)

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	enemy_hurtbox.connect("hitted",self,"_on_hitted")
	stats.connect("no_health",self,"_on_no_health")

func _physics_process(delta):
	if Global.paused:
		animated_sprite.playing = false
		return 1
	else:
		animated_sprite.playing = true
	#print(stats.health)
		knockback = knockback.move_toward(Vector2.ZERO,200*delta)
		knockback= move_and_slide(knockback)
		
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
			var direction = (Global.player_pos - global_position).normalized()
			velocity = velocity.move_toward(MAX_SPEED*direction,delta*120)
		
		if soft_collition.is_colliding():
			velocity+= soft_collition.get_push_vector()*delta*400
		
		animated_sprite.flip_h = direction.x < 0
		
		#velocity = move_and_slide(velocity, Vector2.UP)

func _on_hitted():
	knockback = enemy_hurtbox.knock * 100
	stats.set_health(stats.health - 1)
	
func _on_no_health():
	SoundPlayer.play_sound(SoundPlayer.ENEMY_DEATH)
	#Global.enemies_died += 1
	#Global.enemies_died_high += 1
#	emit_signal("instance_node", tin_can, global_position)
	queue_free()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")


func random_direction():
	var directions = [Vector2.RIGHT, Vector2.LEFT, Vector2.UP, Vector2.DOWN]
	return directions[randi() % directions.size()]
