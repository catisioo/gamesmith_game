extends Control

var dialogueNr = 0


var dialogues = [
	"[center] " + str(GlobalVariables.playerName) + " together with summoned Fish Hero defeated the evil demon lord. It was a long and grueling battle with a lot of sacrifices, but in the end the world was freed.[/center]",
	"[center]After the battle everyone congratulated the heroes of the story. Fish Hero really got into fishing, while " + str(GlobalVariables.playerName) + " fell in love with the nun from the Holy Church and married her.[/center]",
	"[center]The End[/center]"
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
		$first.visible = false
		$second.visible = true
		show_dialogue(n)
	if n == 2:
		hide_dialogue()
		$second.visible = false
		$third.visible = true
		show_dialogue(n)
	if n > 3:
		pass

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogue(0)
	dialogueNr += 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		dialogue(dialogueNr)
		dialogueNr += 1
