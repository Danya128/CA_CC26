extends Node2D

var speed = 200
var isOn_guitar = false
var isOn_drums = false
var isOn_random = false

var random_delay = 0.3
var random_timer = 0.0



var all_keys = [
	"WhiteKey1", "WhiteKey2", "WhiteKey3", "WhiteKey4",
	"WhiteKey5", "WhiteKey6", "WhiteKey7", "WhiteKey8",
	"BlackKey1", "BlackKey2", "BlackKey3", "BlackKey4"
]


	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Guitar_part/guitarButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	$Drums_part/drumsButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	$Random/randomButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	pass # Replace with function body.
	

func spawn_note():
	var note = $Note/Note_img.duplicate()
	note.visible = true
	
	var random_x = randf_range(-100, 100)
	note.position = $Speaker/Speaker.position + Vector2(random_x, -50)
	
	$Note/Notes.add_child(note)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	#######################
	# RANDOM FUNCTION
	#######################
	
	if isOn_random:
		random_timer -= delta
		if random_timer < 0:
			random_timer = random_delay
			var random_key = all_keys.pick_random()
			
			$Player.get_node(random_key + "_Player").play()
			$Player.get_node(random_key + "_Player").volume_db = $SliderVolume.value
			
			$PianoKeys.get_node(random_key).modulate = Color(0.93, 0.0, 0.0, 1.0)
			await get_tree().create_timer(0.2).timeout
			$PianoKeys.get_node(random_key).modulate = Color(1.0, 1.0, 1.0, 1.0)
			spawn_note()
	
	
	
	#######################
	# KEYS
	#######################
	
	# Volume
	for note in all_keys:
		if Input.is_action_just_pressed(note):
			$Player.get_node(note + "_Player").play()
			$Player.get_node(note + "_Player").volume_db = $SliderVolume.value
			
	
	# Highliting
	if Input.is_action_pressed("WhiteKey1"):
		$PianoKeys/WhiteKey1.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey1.modulate = Color(1.0, 1.0, 1.0, 1.0)
	
	if Input.is_action_pressed("WhiteKey2"):
		$PianoKeys/WhiteKey2.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey2.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("WhiteKey3"):
		$PianoKeys/WhiteKey3.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey3.modulate = Color(1.0, 1.0, 1.0, 1.0)
	
	if Input.is_action_pressed("WhiteKey4"):
		$PianoKeys/WhiteKey4.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey4.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("WhiteKey5"):
		$PianoKeys/WhiteKey5.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey5.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("WhiteKey6"):
		$PianoKeys/WhiteKey6.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey6.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("WhiteKey7"):
		$PianoKeys/WhiteKey7.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey7.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("WhiteKey8"):
		$PianoKeys/WhiteKey8.modulate = Color(0.93, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/WhiteKey8.modulate = Color(1.0, 1.0, 1.0, 1.0)
		
	if Input.is_action_pressed("BlackKey1"):
		$PianoKeys/BlackKey1.modulate = Color(0.573, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/BlackKey1.modulate = Color(0.0, 0.0, 0.0, 1.0)
	
	if Input.is_action_pressed("BlackKey2"):
		$PianoKeys/BlackKey2.modulate = Color(0.573, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/BlackKey2.modulate = Color(0.0, 0.0, 0.0, 1.0)
	
	if Input.is_action_pressed("BlackKey3"):
		$PianoKeys/BlackKey3.modulate = Color(0.573, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/BlackKey3.modulate = Color(0.0, 0.0, 0.0, 1.0)
	
	if Input.is_action_pressed("BlackKey4"):
		$PianoKeys/BlackKey4.modulate = Color(0.573, 0.0, 0.0, 1.0)
	else:
		$PianoKeys/BlackKey4.modulate = Color(0.0, 0.0, 0.0, 1.0)
		
	for note in $Note/Notes.get_children():
		if note.visible:
			note.position.y -= speed * delta
			note.modulate.a -= delta * 0.7
			if note.modulate.a <= 0:
				note.visible = 0
		
	if Input.is_action_just_pressed("WhiteKey1") or Input.is_action_just_pressed("WhiteKey2") or Input.is_action_just_pressed("WhiteKey3") or Input.is_action_just_pressed("WhiteKey4") or Input.is_action_just_pressed("WhiteKey5") or Input.is_action_just_pressed("WhiteKey6") or Input.is_action_just_pressed("WhiteKey7") or Input.is_action_just_pressed("WhiteKey8") or Input.is_action_just_pressed("BlackKey1") or Input.is_action_just_pressed("BlackKey2") or Input.is_action_just_pressed("BlackKey3") or Input.is_action_just_pressed("BlackKey4"):
		spawn_note()
		
	pass
	
	#######################
	# DRUMS 
	#######################
	
func _on_button_pressed() -> void:
	var drums_player = $Drums_part/player_drums
	
	if isOn_drums == true:
		isOn_drums = false
		drums_player.stop()
		$Drums_part/drumsButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	else:
		isOn_drums = true
		drums_player.play()
		$Drums_part/drumsButton.modulate = Color(0.254, 0.591, 0.208, 1.0)
			
			
	pass # Replace with function body.



	#######################
	# GUITAR
	#######################

func _on_button_2_pressed() -> void:
	var guitar_player = $Guitar_part/player_guitar
	
	if isOn_guitar == true:
		isOn_guitar = false
		guitar_player.stop()
		$Guitar_part/guitarButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	else:
		isOn_guitar = true
		guitar_player.play()
		$Guitar_part/guitarButton.modulate = Color(0.254, 0.591, 0.208, 1.0)
	
	pass # Replace with function body.
	
	
	#######################
	# Random
	#######################
	
func _on_button_3_pressed() -> void:
	if isOn_random == true:
		isOn_random = false
		$Random/randomButton.modulate = Color(1.0, 0.098, 0.0, 1.0)
	else:
		isOn_random = true
		$Random/randomButton.modulate = Color(0.254, 0.591, 0.208, 1.0)
	
	pass # Replace with function body.
