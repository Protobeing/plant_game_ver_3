extends Control

# an array is a list of items stored in order
# each item in the array is automatically assigned a number starting from 0
# so image1.png is assigned 0, image2.png is assigned 1, image3.png is assigned 2
# we can use these numbers to look up any image in the list
# preload() loads the image from the file path into memory when the game starts
# each image is separated by a comma
var images: Array = [
	preload("res://images/image1.png"),  # index 0
	preload("res://images/image2.png"),  # index 1
	preload("res://images/image3.png")   # index 2
]

# this is an integer variable - it stores a whole number
# we use it to keep track of which image we are currently looking at
# it starts at 0 because arrays always start counting from 0
var current_index: int = 0

# @onready means this variable is set up when the scene is ready
# the $ symbol means we are looking for a node in the scene tree
# display is now a reference to the TextureRect node - we can use it to change the image
@onready var display = $TextureRect

# this function is automatically called every time the button is clicked
# it is connected to the button's "pressed" signal in the editor
func _on_button_pressed() -> void:
	# += 1 means add 1 to current_index
	# so every click moves us one step forward in the array
	current_index += 1
	# images.size() returns the total number of images in the array
	# if current_index is equal to or greater than the total number of images
	# we have reached the end of the array so we reset back to 0
	if current_index >= images.size():
		current_index = 0
	# texture is a property of TextureRect that controls which image it displays
	# images[current_index] looks up the image at the current position in the array
	# so this line swaps the displayed image to the next one in the list
	display.texture = images[current_index]
