extends Node2D

export(bool) var tutorial = false
#onready var game_over_popup = $CanvasLayer/GameOverPopup



func ready():
#	Global.enemies_died = 0
#	Global.tin_collected = 0
	
#	game_over_popup.visible = false
	#(self)
	Global.world = self
	
	
	
func _process(delta):
	Global.world = self
	#print(Global.player_xp - (Global.player_level * 5))
	if Input.is_action_pressed("end_tutorial") and tutorial:
		SoundPlayer.play_sound(SoundPlayer.START)
		SoundPlayer.play_music(SoundPlayer.MUSIC)
		get_tree().change_scene("res://World/World.tscn")
		
	#if Input.is_action_just_pressed("ui_inventory"):
		#call_inventory()
			
	
func _exit_tree():
	Global.world = null
	
func instance_node(node, location):
	
	var node_instance = node.instance()
	add_child(node_instance)
	node_instance.global_position = location 
	return node_instance

#func popup_gms(node,location):
#	game_over_popup.visible = true



