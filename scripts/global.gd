extends Node

# This script is autoloaded in the game
# This script stores all the data like coins between scenes
# This script also helps in changing the levels in the game

# By default, the current stage is 1
var next_stage = 1
# And by default the coin amount is 0
var coinAmount = 0

# A function to go to the next stage
func go_next_stage():
	next_stage += 1 # Adding 1 to the current stage
	
	# When the next scene number is 6, (Scene 6 does not exist)
	# the player gets redirected to the main menu by
	if next_stage == 6:
		get_tree().change_scene("res://scenes/MainMenuUI.tscn")
	# Otherwise if the scene is not 6,
	else:
		get_tree().change_scene("res://scenes/Levels/Level " + str(next_stage) + ".tscn")
		# Here we add everything as strings, including the next_stage variable
		# so that the scenes are changed accordingly
		# Analyse the code and see if you can understand
