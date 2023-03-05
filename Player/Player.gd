extends KinematicBody2D
class_name Player

export(int) var MAX_SPEED = 100
export(int) var ACCELERATION = 100
export(int) var FRICTION = 200
export(PackedScene) var gameover_popup



var input_vector = Vector2.ZERO

var velocity = Vector2.ZERO

var paused = false


onready var animation_player = $AnimationPlayer
onready var animation_tree = $AnimationTree
onready var animation_state = animation_tree.get("parameters/playback")
onready var player_stats = $PlayerStats
onready var player_hurtbox = $PlayerHurtbox
onready var sword_hitbox = $HitboxPivot/SwordHitbox

onready var projectile = preload("res://World/projectile.tscn")

signal popup_gms(node,location)

enum{
	MOVE,
	ROLL,
	ATTACK
}
var state = MOVE


# Called when the node enters the scene tree for the first time.
func _ready():
	player_hurtbox.connect("hitted",self, "_on_hitted")
	PlayerStats.connect("no_health",self, "_on_no_health")
	#player_stats.connect("no_health", self, "change_screen")

func _physics_process(delta):
#	update()
	if Global.paused:
		return 1
	else:
	#print(player_stats.health)
		if Global.world != null:
			if !is_connected("popup_gms", Global.world, "popup_gms"):
				connect("popup_gms", Global.world, "popup_gms")
		Global.player_pos = global_position
		match state:
			MOVE:
				move_state(delta)
			ATTACK:
				attack_state()




func move_state(delta):
	
	input_vector.x= Input.get_action_strength("ui_right")- Input.get_action_strength("ui_left")
	input_vector.y= Input.get_action_strength("ui_down")- Input.get_action_strength("ui_up")
	input_vector= input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		sword_hitbox.knockback_vector = input_vector
		Global.projectile_knockback_vector = input_vector
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/attack/blend_position", input_vector)
		animation_state.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		animation_state.travel("Idle")
		
	
		
	
	#velocity=input_vector * MAX_SPEED
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("ui_accept"):
		state = ATTACK
		var pos = global_position
		Event.emit_signal("shots_fired", projectile, pos,animation_tree.get("parameters/attack/blend_position"))
#		if Global.sword_duration > 0:
#
#			Global.sword_duration -= 1
			#(Global.sword_duration)
		


func attack_state():
	animation_state.travel("attack")

func attack_anim_finished():
	state = MOVE

func _on_hitted():
	#print("USO")
	#SoundPlayer.play_sound(SoundPlayer.PLAYER_DMG)
	PlayerStats.set_health(PlayerStats.health - 1)
	

func recicle():
	#Event.emit_signal("recycle")
#	while(Global.tin_collected >= 1):
#		SoundPlayer.play_sound(SoundPlayer.SWORD_GET)
#		Global.sword_duration += 2
#		oneup.play("oneup")
#		Global.tin_collected -= 1
	pass
		
func _on_no_health():
	emit_signal("popup_gms",gameover_popup, Vector2(52,64))
	queue_free()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _draw():
#	draw_circle(Vector2(0,0) + position, 10, Color.yellow)
#	print(global_position)
