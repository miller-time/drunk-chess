extends MarginContainer

@export var col: int
@export var row: int

var behavior: Queen

func _init() -> void:
	behavior = Queen.new()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var location = Vector2(col, row)
		var squares = behavior.reachable_squares(col, row)
		print("white queen at ", location, " can move to ", squares)
