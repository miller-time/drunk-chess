extends MarginContainer

@export var col: int
@export var row: int

var behavior: Rook

func _init() -> void:
	behavior = Rook.new()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var location = Vector2(col, row)
		var squares = behavior.reachable_squares(col, row)
		print("white rook at ", location, " can move to ", squares)
