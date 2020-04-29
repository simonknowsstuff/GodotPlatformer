extends CanvasLayer # This script is in a CanvasLayer so we use extends CanvasLayer

# This is the Main Menu UI Script
# This Script controls every single child in the scene

func _ready(): # When the scene is ready,
	global.next_stage = 1 # The current stage is set to 1

func _on_Quit_Button_pressed(): # When the Quit Button is pressed,
	get_tree().quit() # This code quits the game


func _on_Play_Button_pressed(): # When the Play Button is pressed,
	# This code changes the scene
	global.coinAmount = 0 # By default, set the player's coin amount to 0
	get_tree().change_scene("res://scenes/Levels/Level 1.tscn") # Change the scene to Level 1
	# The location to the scene is in the scenes folder


# Basically each segment can be called as a scene
# For example, a level is a scene. The main menu is a scene.
# So in the play button, we are requesting Godot to change the scene
# to a particular path that is res://"location to scene"

func _on_Music_Toggle_Button_toggled(button_pressed): # Toggled functionality of the button
	if button_pressed == true: # If the toggle is true
		MusicController.play() # MusicController plays the track
	elif button_pressed == false: # If the toggle is false
		MusicController.stop() # MusicController stops

