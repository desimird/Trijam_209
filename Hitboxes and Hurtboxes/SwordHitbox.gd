extends Area2D
class_name Sword

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var knockback_vector = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SwordHitbox_area_entered(area):
	
	if area.get_parent() is WalkingEnemy:
		SoundPlayer.play_sound(SoundPlayer.HIT_ENEMY)
		area.emit_signal("hitted")
