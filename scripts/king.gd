class_name King extends Piece

func reachable_squares(col: int, row: int) -> Array[Vector2]:
	var candidates: Array[Vector2] = [
		Vector2(col - 1, row - 1),
		Vector2(col - 1, row),
		Vector2(col - 1, row + 1),
		Vector2(col, row - 1),
		Vector2(col, row + 1),
		Vector2(col + 1, row - 1),
		Vector2(col + 1, row),
		Vector2(col + 1, row + 1)
	]
	var squares: Array[Vector2] = []
	for square in candidates:
		if square.x >= 0 and square.x <= 7 and square.y >= 0 and square.y <= 7:
			squares.push_back(square)
	return squares
