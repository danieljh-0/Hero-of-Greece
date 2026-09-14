extends Node2D

@onready var btnItem1: Button = $CanvasLayer/Control/VBoxContainer/HBoxContainer/btnItem1
@onready var btnItem2: Button = $CanvasLayer/Control/VBoxContainer/HBoxContainer/btnItem2
@onready var item1Sprite: AnimatedSprite2D = $CanvasLayer/Control/VBoxContainer/HBoxContainer/btnItem1/Control/AnimatedSprite2D
@onready var item2Sprite: AnimatedSprite2D = $CanvasLayer/Control/VBoxContainer/HBoxContainer/btnItem2/Control/AnimatedSprite2D
@onready var weapon: Area2D = $Hero/Weapon
@onready var lblDrachma: Label = $"CanvasLayer/Drachma Label"

var item1Active = false
var item2Active = false
var item1 = null
var item2 = null

func _ready() -> void:
	Globals.health = 100
	item1 = item1Sprite.animation
	item2 = item2Sprite.animation
	Globals.weapon = item1
	item1A()
	item2I()
	
	weapon.get_child(0).animation = item1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lblDrachma.text = "Drachmas: " + str(Globals.drachmas)


func _on_btn_item_1_pressed() -> void:
	if !item1Active:
		item1A()
		item2I()
		weapon.get_child(0).animation = item1
		Globals.weapon = item1
		

func _on_btn_item_2_pressed() -> void:
	if !item2Active:
		item2A()
		item1I()
		weapon.get_child(0).animation = item2
		Globals.weapon = item2
		

func item1A() -> void:
	var activeStyle = btnItem1.get_theme_stylebox("normal").duplicate()
	activeStyle.border_width_top = 5
	activeStyle.border_width_bottom = 5
	activeStyle.border_width_left = 5
	activeStyle.border_width_right = 5
	btnItem1.add_theme_stylebox_override("normal", activeStyle)
	item1Active = true
	
func item1I() -> void:
	var inactiveStyle = btnItem1.get_theme_stylebox("normal").duplicate()
	inactiveStyle.border_width_top = 1
	inactiveStyle.border_width_bottom = 1
	inactiveStyle.border_width_left = 1
	inactiveStyle.border_width_right = 1
	btnItem1.add_theme_stylebox_override("normal", inactiveStyle)
	item1Active = false
	
func item2A() -> void:
	var activeStyle = btnItem2.get_theme_stylebox("normal").duplicate()
	activeStyle.border_width_top = 5
	activeStyle.border_width_bottom = 5
	activeStyle.border_width_left = 5
	activeStyle.border_width_right = 5
	btnItem2.add_theme_stylebox_override("normal", activeStyle)
	item2Active = true
	
func item2I() -> void:
	var inactiveStyle = btnItem2.get_theme_stylebox("normal").duplicate()
	inactiveStyle.border_width_top = 1
	inactiveStyle.border_width_bottom = 1
	inactiveStyle.border_width_left = 1
	inactiveStyle.border_width_right = 1
	btnItem2.add_theme_stylebox_override("normal", inactiveStyle)
	item2Active = false
