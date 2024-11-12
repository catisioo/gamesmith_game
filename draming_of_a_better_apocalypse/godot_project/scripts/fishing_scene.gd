extends Node2D

var seeFishingButton = false
var seeReturnButton = false

var dialogues = [
	"[color=#00A10B]You caught a fish.[/color]",
	"[color=#EB0010]The fish swam away. Try again.[/color]"
]


func show_dialogue(n):
	$Player/Camera2D/RichTextLabel.text = dialogues[n]
	$Player/Camera2D/RichTextLabel.visible = true

func hide_dialogue():
	$Player/Camera2D/RichTextLabel.visible = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$interactables/fishing/fishingButton.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$interactables/fishing/fishingButton.visible = seeFishingButton
	$interactables/return/upButton.visible = seeReturnButton

func _on_fishing_body_entered(player_main):
	seeFishingButton = true


func _on_fishing_body_exited(player_main):
	seeFishingButton = false
	hide_dialogue()


func _on_button_pressed():
	var chance = randf()
	if chance < 0.5:
		show_dialogue(0)
		GlobalVariables.haveFish = true
	else:
		show_dialogue(1)


func _on_return_body_entered(player_main):
	seeReturnButton = true


func _on_return_body_exited(player_main):
	seeReturnButton = false


func _on_up_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
