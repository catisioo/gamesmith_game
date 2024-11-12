extends Control

var dialogueNr = 0


var dialogues = [
	"[center] " + str(GlobalVariables.playerName) + " and the rest of the team managed to develop an AI robot that could infiltrate THE GROUP and inject a malicious code that would shut down all the evil AI robots in the world.[/center]",
	"[center]The AI robot they developed actually gained consciousness too, but they decided to sacrifice themselves for the entirety of humanity by replacing every robots code with their own, ensuring the continued coexistence of humans and peaceful robots.[/center]",
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
