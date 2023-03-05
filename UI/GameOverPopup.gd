extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var label_2 = $font/Label2
var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	#points = 100* Global.enemies_died_high
	points = 100
	label_2.text = "%d" % points
	


#func _on_Button_pressed():
#
#	PlayerStats.set_health(PlayerStats.max_health)
#	get_tree().change_scene("res://World.tscn")
