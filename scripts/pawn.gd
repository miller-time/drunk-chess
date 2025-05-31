class_name Pawn extends Piece

var has_moved: bool
var y_direction: int

func set_y_direction(y: int):
	y_direction = y

func reachable_squares(col: int, row: int) -> Array[Vector2]:
	print("reachable from col: ", col, " row: ", row)
	if has_moved:
		return [Vector2(col, row + (1 * y_direction))]
	return [Vector2(col, row + (1 * y_direction)), Vector2(col, row + (2 * y_direction))]
