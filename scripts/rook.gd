class_name Rook extends Piece

func reachable_squares(col: int, row: int) -> Array[Vector2]:
	var squares: Array[Vector2] = []
	for i in range(8):
		if i != col:
			squares.push_back(Vector2(i, row))
	for j in range(8):
		if j != row:
			squares.push_back(Vector2(col, j))
	return squares
