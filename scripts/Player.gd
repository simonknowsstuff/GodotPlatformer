extends KinematicBody2D # The player is a kinematic body, hence extends Kine..

# Adjustable variables of the player
# export is used to allow to edit the values outside the script
export var speed = 500 # The speed of the character
export var gravity = 32 # The gravity of the character
export var jumpforce = 800 # The jump force of the character

# Vector2 Variable for motion
var motion = Vector2.ZERO 
# This is the vector2 that will make the player move
# in x and y coordinates

# Reference variables
# To reference a game object, we can either use get_node("Sprite name")
# Or we can use $GameObject
onready var GroundChecker = $GroundCheck # This is a raycast that checks if we are on ground.
onready var JumpSound = $JumpSound # This is an AudioStreamPlayer that plays the jump sound if triggered.
onready var ScoreDisplay = $"UI Element/ScoreText" # This is the scoredisplay that displays the score

func _physics_process(delta): # By default, the physics process is used.
	# The physics process is used so that the game can calculate the physics
	# in the game instead of calculating it each frame
	
	# Displaying the score:
	ScoreDisplay.text = "Score: " + String(global.coinAmount) + "/16"
	# The ScoreDisplay only allows String as input so we have to make sure we convert
	# the coinAmount to String as the coinAmount, by default, is an integer
	
	# The total coins in all the levels is 16
	
	# Player movement functions:
	if Input.is_action_pressed("ui_right"): # If the player enters the right arrow
		motion.x = speed # then the x coordinates of the vector be positive
	elif Input.is_action_pressed("ui_left"): # If the player enters the left arrow
		motion.x = -speed # then the x coordinates of the vector be negative
	else: # If none of these are pressed
		motion.x = lerp(motion.x, 0, 0.25) # set the x to 0 by smoothly transitioning by 0.25
	
	if GroundChecker.is_colliding(): # If the ground checker is colliding with the ground
		if Input.is_action_pressed("ui_up"): # And the player hits the up arrow key
			JumpSound.play() # Play the jump sound
			motion.y = -jumpforce # then jump by jumpforce
	
	motion.y += gravity + delta # Always make the player fall down
	
	motion = move_and_slide(motion, Vector2.UP)
	# Move and slide is a function which allows the kinematic body to detect
	# collisions and move accordingly


