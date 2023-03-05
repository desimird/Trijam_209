extends Position2D


export(PackedScene) var enemy
export(int) var R = 200

var level = Global.lvl_dif


var generated = false
var angle_step = 0
signal instance_node(node, location)

func _ready():
	
	randomize()

# Called when the node enters the scene tree for the first time.
func _process(delta):
	#print(Global.world)
	if Global.world != null:
		if !is_connected("instance_node", Global.world, "instance_node"):
			connect("instance_node", Global.world, "instance_node")
	if not generated:
		generateit(level)
		generated = true
	#(Global.enemies_died)
	#print(level)
	if Global.enemies_died == level*2:
		generateit(level+1)
		Global.enemies_died = 0

func generateit(level):
	if level == 0:
		angle_step = 180
	else:
		angle_step = 360/ level*2
	for i in range(level*2):
		var pos = global_position + Vector2(cos(i*angle_step), sin(i*angle_step)) * 100
		emit_signal("instance_node",enemy,pos)
	Global.lvl_dif += 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
