extends Node2D

export(PackedScene) var lvl_gen
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var game_over_popup = $CanvasLayer/GameOverPopup


# Called when the node enters the scene tree for the first time.
func _ready():
	game_over_popup.visible = false
	Global.world = self
	add_child(lvl_gen.instance())
	Event.connect("shots_fired", self, "shots_fired")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func shots_fired(node, location, direction):
	Global.projectile_dir = direction
	var shot_instance = node.instance()
	add_child(shot_instance)
	shot_instance.global_position = location 
	
func instance_node(node, location):
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location 
	
func popup_gms(node,location):
	game_over_popup.visible = true
