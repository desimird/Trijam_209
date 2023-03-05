extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var label = $font/Label
onready var label_2 = $font/Label2

onready var texture_rect = $font/TextureRect

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

func set_hearts(value):
	#vrednost ce uvek biti izmedju 0 i max_hearts:
	hearts = clamp(value,0,max_hearts)
	if texture_rect != null:
		texture_rect.rect_size.x = hearts * 15
	

# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#label.text = "x%d" % Global.sword_duration
	#label_2.text = "x%d" % Global.tin_collected
	pass
	
		
func set_max_hearts(value):
	max_hearts = max(value,1)
	self.hearts = min(hearts, max_hearts)
