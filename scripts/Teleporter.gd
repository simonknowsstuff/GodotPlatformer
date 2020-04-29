extends Area2D # We need Area2D functionality


func _on_Teleporter_body_entered(body): # If body collision is detected,
	if body.name == "Player": # If the body is a player,
		global.go_next_stage() # Then go to next scene
