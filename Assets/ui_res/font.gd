extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var bitmapFont: BitmapFont
# Called when the node enters the scene tree for the first time.
func _ready():
	setup_font()


func setup_font():
	bitmapFont = BitmapFont.new()
	bitmapFont.add_texture(preload("res://Assets/ui_res/font.png"))
	bitmapFont.height = 8 
	
	
	
	bitmapFont.add_char(32, 0 ,Rect2(8*14,8*31,8,8), Vector2(0,0), 6)  # space
	bitmapFont.add_char(44, 0 ,Rect2(8*13,8*31,8,8), Vector2(0,0), 6)  # ,
	bitmapFont.add_char(46, 0 ,Rect2(8*12,8*31,8,8), Vector2(0,0), 6)  # .
	bitmapFont.add_char(63, 0 ,Rect2(8*10,8*31,8,8), Vector2(0,0), 6)  #?
	bitmapFont.add_char(33, 0 ,Rect2(8*11,8*31,8,8), Vector2(0,0), 6)  #!
	bitmapFont.add_char(48, 0 ,Rect2(8*9,8*31,8,8), Vector2(0,0), 6)   #0
	for j in range(9):
		bitmapFont.add_char(49+j, 0 ,Rect2(8*(j),8*31,8,8), Vector2(0,0), 6) #numbers
	for i in range(26):
		bitmapFont.add_char(65+i, 0 ,Rect2(8*(i+1),8*30,8,8), Vector2(0,0), 6) #upcap letters
		bitmapFont.add_char(97+i, 0 ,Rect2(8*(i+1),8*30,8,8), Vector2(0,0), 6) #lowcap letters
		
	
	
	theme.default_font = bitmapFont
