extends Control

# Load the music player node
onready var _player = $"Audio Player"

# Calling this function will load the track, and play it
func play():
	_player.play() # Play the track

# Calling this function will stop the music
func stop():
	_player.stop() # Stop the track
