extends Control

var images: Array = [

	preload("res://images/background-Sheet1.png"),
	preload("res://images/background-Sheet2.png"),
	preload("res://images/background-Sheet3.png"),
	preload("res://images/background-Sheet4.png"),
	preload("res://images/background-Sheet5.png"),
	preload("res://images/background-Sheet6.png"),
	preload("res://images/background-Sheet7.png"),
	preload("res://images/background-Sheet8.png"),
	preload("res://images/background-Sheet9.png"),
	preload("res://images/background-Sheet10.png"),
	preload("res://images/background-Sheet11.png"),
	preload("res://images/background-Sheet12.png"),
	preload("res://images/background-Sheet13.png"),
	preload("res://images/background-Sheet14.png"),
	preload("res://images/background-Sheet15.png"),
	preload("res://images/background-Sheet16.png"),
	preload("res://images/background-Sheet17.png"),
	preload("res://images/background-Sheet18.png"),
	preload("res://images/background-Sheet19.png"),
	preload("res://images/background-Sheet20.png"),
	preload("res://images/background-Sheet21.png"),
	preload("res://images/background-Sheet22.png"),
	preload("res://images/background-Sheet23.png"),
	preload("res://images/background-Sheet24.png"),
	preload("res://images/background-Sheet25.png"),
	preload("res://images/background-Sheet26.png"),
	preload("res://images/background-Sheet27.png"),
	preload("res://images/background-Sheet28.png"),
	preload("res://images/background-Sheet29.png"),
	preload("res://images/background-Sheet30.png"),
	preload("res://images/background-Sheet30.png"),
	preload("res://images/background-Sheet31.png"),
	preload("res://images/background-Sheet32.png"),
	preload("res://images/background-Sheet33.png"),
	preload("res://images/background-Sheet34.png"),
	preload("res://images/background-Sheet35.png"),
	preload("res://images/background-Sheet36.png"),
	preload("res://images/background-Sheet37.png"),
	preload("res://images/background-Sheet38.png"),
	preload("res://images/background-Sheet39.png"),
	preload("res://images/background-Sheet40.png"),
	preload("res://images/background-Sheet41.png"),
	preload("res://images/background-Sheet42.png"),
	preload("res://images/background-Sheet43.png"),
	preload("res://images/background-Sheet43.png"),
	preload("res://images/background-Sheet44.png"),
	preload("res://images/background-Sheet45.png"),
	preload("res://images/background-Sheet46.png"),
	preload("res://images/background-Sheet47.png"),
	preload("res://images/background-Sheet48.png"),
	preload("res://images/background-Sheet49.png"),
	preload("res://images/background-Sheet50.png"),
	preload("res://images/background-Sheet51.png"),
	preload("res://images/background-Sheet52.png"),
	preload("res://images/background-Sheet53.png"),
	preload("res://images/background-Sheet54.png"),
	preload("res://images/background-Sheet55.png"),
	preload("res://images/background-Sheet56.png"),
	preload("res://images/background-Sheet57.png"),
	preload("res://images/background-Sheet58.png"),
	preload("res://images/background-Sheet59.png"),
	preload("res://images/background-Sheet60.png"),
	preload("res://images/background-Sheet61.png"),
	preload("res://images/background-Sheet62.png"),
	preload("res://images/background-Sheet63.png"),
	preload("res://images/background-Sheet64.png"),
	preload("res://images/background-Sheet65.png"),
	preload("res://images/background-Sheet66.png"),
	preload("res://images/background-Sheet67.png"),
	preload("res://images/background-Sheet68.png"),
	preload("res://images/background-Sheet69.png"),
	preload("res://images/background-Sheet70.png"),
	preload("res://images/background-Sheet71.png"),
	preload("res://images/background-Sheet72.png"),
	preload("res://images/background-Sheet73.png")
	
]

var pouring = false
var current_index: int = 0
var button_being_pressed = false

@onready var click_button = $Button
@onready var water_bucket = $water_bucket

func _ready() -> void:
	add_image(current_index)
func _process(_delta: float) -> void:
	water_bucket.global_position = get_global_mouse_position()
func _on_button_pressed() -> void:
	if not button_being_pressed:
		button_being_pressed = true
		$button_timer.start()
		$water_bucket/CPUParticles2D.emitting = true
		$AudioStreamPlayer2D.playing = true
		current_index += 1
		if current_index >= images.size():
			current_index = 0
			for child in get_children():
				if child is TextureRect:
					child.queue_free()
		add_image(current_index)

func add_image(index: int) -> void:
	var new_image = TextureRect.new()
	new_image.texture = images[index]
	new_image.mouse_filter = Control.MOUSE_FILTER_IGNORE
	new_image.position = $Marker2D.position
	add_child(new_image)
	move_child(click_button, get_child_count() - 1)
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and not pouring:
		pouring = true
		$pouring.start()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$water_bucket/CPUParticles2D.emitting = true
			$AudioStreamPlayer2D.playing = true


func _on_button_timer_timeout() -> void:
	button_being_pressed = false


func _on_pouring_timeout() -> void:
	pouring = false
