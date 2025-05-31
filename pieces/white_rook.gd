class_name WhiteRook extends MarginContainer

signal clicked(rook: WhiteRook)

@export var col: int
@export var row: int

var behavior: Rook

func _init() -> void:
	behavior = Rook.new()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", self)

func set_pos(i: int, j: int):
	col = i
	row = j

func reachable_squares():
	return behavior.reachable_squares(col, row)
