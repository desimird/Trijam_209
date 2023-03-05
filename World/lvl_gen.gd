extends Node2D


export(PackedScene) var wall
export(PackedScene) var player
export(PackedScene) var enemy
export(PackedScene) var artifact
export(int) var randzic = 400
export(int) var uslovcic = 50

var level_plain = [LevelsPlain.maze1,LevelsPlain.maze2,LevelsPlain.maze3,LevelsPlain.maze4,LevelsPlain.maze5,LevelsPlain.maze6]
var enemy_count = 0
var last_enemy_pos = Vector2.ZERO






func _ready():
	randomize()
	var maze = to_matrix()
	for i in range(maze.size()):
		for j in range(maze[i].size()):
			if maze[i][j] == 1:
				var wall_instance = wall.instance()
				wall_instance.global_position = Vector2(j * 16, i * 16)
				add_child(wall_instance)
			if maze[i][j] == 2:
				var player_instance = player.instance()
				player_instance.global_position = Vector2(j * 16, i * 16)
				add_child(player_instance)
			if maze[i][j] == 3:
				var artifact_instance = artifact.instance()
				artifact_instance.global_position = Vector2(j * 16, i * 16)
				add_child(artifact_instance)
			if maze[i][j] == 0:
				if enemy_count <= 5: #broj neprijatelja po nivou
					var action = round(rand_range(0, randzic))
					if action > 0 and action < uslovcic:
						var enemy_instance = enemy.instance()
						enemy_instance.global_position = Vector2(j * 16, i * 16)
						if enemy_instance.global_position.distance_to(last_enemy_pos) > 200:
							add_child(enemy_instance)
							enemy_count += 1
							last_enemy_pos = enemy_instance.global_position
				

func to_matrix():
	var maze = []
	#var plain = "1111111111111111111110000000000000000001101111111111110111011010000000100001010110101111011111010101100010000000010000011010111011110101010110000000000000000001101111101111011111011000000000000100000110101110101011110101101010000000001010011010101110111010100110001000000000000001101111011101110111011000000000000000000110111110101111011101100000000000010000011000000000000000000111111111111111111111"
	var plain = level_plain[randi() % level_plain.size()]
	print(randi() % level_plain.size())
	for i in range(21):
		var plain_part = plain.substr(i*20,20)
		var array = []
		for j in plain_part:
			array.append(int(j))
		maze.append(array)
		

	return maze



