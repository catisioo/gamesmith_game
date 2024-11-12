extends Node2D
var showComputerInteractionLabel = false
var showDownInteractionLabel = false
var showSleepInteractionLabel = false
var showForeverSlInteractionLabel = false
var showCookInteractionLabel = false

#array of all dialogue lines
var dialogues = [
	"Work sponsored computer. All games on it are online only and there is no internet. It overheats when you run it for too long.",
	"[color=#00A10B]You cook a fish, using your computer as a stove. You eat the fish. You are no longer hungry.[/color]",
	"[color=#EB0010]You have nothing to cook. You should find some food.[/color]",
	"[color=#EB0010]You can't fall asleep because you are hungry. Maybe you should cook something.[/color]"
]


func show_dialogue(n):
	$Player/Camera2D/RichTextLabel.text = dialogues[n]
	$Player/Camera2D/RichTextLabel.visible = true

func hide_dialogue():
	$Player/Camera2D/RichTextLabel.visible = false


func _ready():
	$turbine/day_counter.text = str(GlobalVariables.currentDay)

func _process(delta):
	$interactables/computer/computer_button.visible = showComputerInteractionLabel
	$interactables/down/down_button.visible = showDownInteractionLabel
	$interactables/sleep/sleep_button.visible = showSleepInteractionLabel
	$interactables/sleep/forever_sleep_button.visible = showForeverSlInteractionLabel
	$interactables/cook/cook_button.visible = showCookInteractionLabel
	
func _on_computer_body_entered(player_main):
	showComputerInteractionLabel = true
func _on_computer_body_exited(player_main):
	showComputerInteractionLabel = false
	hide_dialogue()

func _on_computer_button_pressed():
	show_dialogue(0)
	


func _on_down_body_entered(body):
	showDownInteractionLabel = true
func _on_down_body_exited(body):
	showDownInteractionLabel = false

func _on_down_button_pressed():
	get_tree().change_scene_to_file("res://scenes/fishing_scene.tscn")



func _on_sleep_body_entered(body):
	showSleepInteractionLabel = true
	if GlobalVariables.currentDay > 4:
		showForeverSlInteractionLabel = true
func _on_sleep_body_exited(body):
	showSleepInteractionLabel = false
	showForeverSlInteractionLabel = false
	hide_dialogue()

func _on_sleep_button_pressed():
	print(GlobalVariables.currentDay)
	print("^curr day")
	"""
	if GlobalVariables.haveEaten == true:
	#print(GlobalVariables.currentDay)
		if GlobalVariables.currentDay % 3 == 0:
			get_tree().change_scene_to_file("res://scenes/dream_three.tscn")
		elif GlobalVariables.currentDay % 3 == 2:
			get_tree().change_scene_to_file("res://scenes/dream_two.tscn")
		elif GlobalVariables.currentDay % 3 == 1:
			get_tree().change_scene_to_file("res://scenes/dream_one.tscn")
		"""
	if GlobalVariables.haveEaten == true:
		if GlobalVariables.currentDay % 2 == 0:
			get_tree().change_scene_to_file("res://scenes/dream_two.tscn")
		elif GlobalVariables.currentDay % 2 == 1:
			get_tree().change_scene_to_file("res://scenes/dream_one.tscn")
		GlobalVariables.currentDay += 1
		GlobalVariables.haveEaten = false
		GlobalVariables.haveFish = false
	else:
		show_dialogue(3)
	




func _on_forever_sleep_button_pressed():
	"""
	if (GlobalVariables.currentDay-1) % 3 == 0:
		GlobalVariables.canFinishGame = true
		print("forever dream 3")
		get_tree().change_scene_to_file("res://scenes/dream_three.tscn")
	elif (GlobalVariables.currentDay-1) % 3 == 2:
		GlobalVariables.canFinishGame = true
		print("forever dream 2")
		get_tree().change_scene_to_file("res://scenes/dream_two.tscn")
	elif (GlobalVariables.currentDay-1) % 3 == 1:
		GlobalVariables.canFinishGame = true
		print("forever dream 1")
		get_tree().change_scene_to_file("res://scenes/dream_one.tscn")
	"""
	if (GlobalVariables.currentDay-1) % 2 == 0:
		GlobalVariables.canFinishGame = true
		get_tree().change_scene_to_file("res://scenes/dream_two.tscn")
	elif (GlobalVariables.currentDay-1) % 2 == 1:
		GlobalVariables.canFinishGame = true
		get_tree().change_scene_to_file("res://scenes/dream_one.tscn")

func _on_cook_body_entered(body):
	showCookInteractionLabel = true
func _on_cook_body_exited(body):
	showCookInteractionLabel = false
	hide_dialogue()

func _on_cook_button_pressed():
	if GlobalVariables.haveFish == true:
		show_dialogue(1)
		GlobalVariables.haveEaten = true
	else:
		show_dialogue(2)
