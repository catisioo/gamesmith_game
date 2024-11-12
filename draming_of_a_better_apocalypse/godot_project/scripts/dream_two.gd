extends Node2D

var dialogueNr = 0


var dialogues = [
	"[center]You're here for the resistance team right, " + str(GlobalVariables.playerName) + "?[/center]",
	"[center]Ever since THE AI gained consciousness, we've had to hide from all the evil robots.[/center]",
	"[center]But I think we can finally turn the tide on this robot apocalypse. You're one of the best hackers around and we've also been working on our own protoype AI robot to infiltrate THE GROUP.[/center]",
	"[center]Let's use this teleporter to go back to our HQ and start fixing this mess.[/center]"
]


func show_dialogue(n):
	$RichTextLabel.text = dialogues[n]
	$RichTextLabel.visible = true

func hide_dialogue():
	$RichTextLabel.visible = false
	
func dialogue(n):
	if n == 0:
		show_dialogue(n)
	if n == 1:
		hide_dialogue()
		show_dialogue(n)
	if n == 2:
		hide_dialogue()
		show_dialogue(n)
	if n == 3:
		hide_dialogue()
		show_dialogue(n)
		$solve_apocalypse.visible = true
	else:
		pass
# Called when the node enters the scene tree for the first time.
func _ready():
	$solve_apocalypse.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		dialogue(dialogueNr)
		dialogueNr += 1
	pass




func _on_solve_apocalypse_pressed():
	if GlobalVariables.canFinishGame == false:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/cutscene_two.tscn")
