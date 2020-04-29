extends Area2D # The coin is an Area2D so we need Area2D functionality

# We use signals here
# This function runs when the coin detects a body collision
func _on_Coin_body_entered(body): # The body argument can be used to find the details of the body
	# If the player is the specific group mentioned below
	if body.is_in_group("Player") == true: # The player is in the "Player" group
		global.coinAmount += 1 # Add 1 to the current coin amount globally
		hide() # Run the hide function
		$CoinSoundPlayer.play() # Play the coin sound
		yield($CoinSoundPlayer, "finished") # Wait until the track has been finished
		queue_free() # Delete from the scene
	
func hide(): # The hide function
	visible = false # Set the visible property to false

