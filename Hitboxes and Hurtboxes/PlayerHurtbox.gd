extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal hitted

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_PlayerHurtbox_area_entered(area):
	if not area.get_parent() is WalkingEnemy: return
	#emit_signal("hitted") 
