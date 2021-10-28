extends Popup

var player

func _ready():
	var tree = get_tree()
	player = tree.get_nodes_in_group("Player")[0]

func _input(event):
	if visible:
		player.set_process_input(false)

		if Input.is_action_just_pressed("ui_cancel"):
			player.set_process_input(true)
			hide()
		

