extends Node

#const ENEMY_DEATH = preload("res://res/wetransfer_sfx-za-deska_2022-11-13_2118/sfx za deska/EnemyDeath.wav")
#const HIT_ENEMY = preload("res://res/wetransfer_sfx-za-deska_2022-11-13_2118/sfx za deska/HitEnemy.wav")
#const PLAYER_DMG = preload("res://res/wetransfer_sfx-za-deska_2022-11-13_2118/sfx za deska/PlayerDMG.wav")
#const START = preload("res://res/wetransfer_sfx-za-deska_2022-11-13_2118/sfx za deska/Start.wav")
#const SWORD_GET = preload("res://res/wetransfer_sfx-za-deska_2022-11-13_2118/sfx za deska/SwordGEt.wav")
#const MUSIC = preload("res://res/rhythm_garden_0.ogg")
const ENEMY_DEATH = null
const HIT_ENEMY = null
const PLAYER_DMG = null 
const START = null
const SWORD_GET = null
const MUSIC = null

onready var music_player = $Music
onready var audio_players: = $AudioPlayers

func play_sound(sound):
	for audio_stream_player in audio_players.get_children():
		if not audio_stream_player.playing:
			audio_stream_player.stream = sound
			audio_stream_player.play()
			break
			

func stop_all():
	for audio_stream_player in audio_players.get_children():
		if audio_stream_player.playing:
			audio_stream_player.stop()
			
func play_music(music):
	music_player.stream = music
	music_player.play()
	
func stop_music():
	music_player.stop()
