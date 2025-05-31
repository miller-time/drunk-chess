class_name WhitePawn extends MarginContainer

signal clicked(pawn: WhitePawn)

@export var col: int
@export var row: int

var behavior: Pawn

func _init() -> void:
	behavior = Pawn.new()
	behavior.set_y_direction(-1)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", self)

func set_pos(i: int, j: int):
	col = i
	row = j

func reachable_squares():
	return behavior.reachable_squares(col, row)
