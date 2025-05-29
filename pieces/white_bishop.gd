extends MarginContainer

@export var col: int
@export var row: int

var behavior: Bishop

func _init() -> void:
	behavior = Bishop.new()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var location = Vector2(col, row)
		var squares = behavior.reachable_squares(col, row)
		print("white bishop at ", location, " can move to ", squares)

func set_pos(i: int, j: int):
	col = i
	row = j
