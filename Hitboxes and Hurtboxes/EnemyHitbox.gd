extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_EnemyHitbox_area_entered(area):
	print(area.get_parent())
	if not area.get_parent() is Player: return
	#print(area.get_parent())
	area.emit_signal("hitted")
