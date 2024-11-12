extends Node2D

var dialogueNr = 0


var dialogues = [
	"[center]Thank you " + str(GlobalVariables.playerName) + " for answering the call of the Holy Church[/center]",
	"[center]Ever since the Demon Lord reawakened, he has caused an apocalypse than none of us can help[/center]",
	"[center]So why did you call for me?[/center]",
	"[center]You are the most powerful summoner of this land and our last chance to stand our ground against the apocalypse[/center]",
	"[center]Alright, I'll summon my most powerful Fish Hero to defeat the Demon Lord[/center]",
	"[center]Time to go defeat the Demon Lord and put an end to the apocalypse![/center]"
]


func show_dialogue(n):
	$RichTextLabel.text = dialogues[n]
	$RichTextLabel.visible = true

func hide_dialogue():
	$RichTextLabel.visible = false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$solve_apocalypse.visible = false


func dialogue(n):
	if n == 0:
		show_dialogue(n)
		$nun.play("active")
	if n == 1:
		hide_dialogue()
		show_dialogue(n)
	if n == 2:
		hide_dialogue()
		$nun.play("passive")
		show_dialogue(n)
		$main_char.play("active")
	if n == 3:
		hide_dialogue()
		$main_char.play("passive")
		show_dialogue(n)
		$nun.play("active")
	if n == 4:
		hide_dialogue()
		$nun.play("passive")
		show_dialogue(n)
		$main_char.play("active")
	if n >= 5:
		$gacha.visible = true
		hide_dialogue()
		show_dialogue(5)
		$solve_apocalypse.visible = true
	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$main_char.play("active")
	#wait 1 sec
	#$main_char.play("passive")
	if Input.is_action_just_pressed("click"):
		dialogue(dialogueNr)
		dialogueNr += 1
	pass


func _on_solve_apocalypse_pressed():
	if GlobalVariables.canFinishGame == false:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/cutscene_one.tscn")
