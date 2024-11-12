extends Control
var pullcount = 0
var can_pull = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_pull == true:
		if Input.is_action_just_pressed("click") and pullcount <= 10:
			if pullcount == 0:
				$pull_bg/koi.visible = true
			
			pullcount += 1
			
			if pullcount == 11:
				$banner_bg/ColorRect.visible = false
				$pull_bg.visible = false
			elif pullcount == 10:
				$pull_bg/koi.play("koi")
				print(pullcount)
				print("guaranteed koi")
			else:
				var random_chance = randf()
				print(random_chance)
				print(pullcount)
				if random_chance < 0.1:
					$pull_bg/koi.play("koi")
					print("koi")
				elif random_chance < 0.55:
					$pull_bg/koi.play("shard2")
					print("shard2")
				else:
					$pull_bg/koi.play("shard1")
					print("shard1")



func _on_pull_pressed():
	if pullcount < 2:
		can_pull = true
		$banner_bg/ColorRect.visible = true
		$pull_bg.visible = true
	
	
func _on_button_pressed():
	$".".visible = false
