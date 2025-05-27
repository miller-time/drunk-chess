class_name Bishop extends Piece

func reachable_squares(col: int, row: int) -> Array[Vector2]:
	var squares: Array[Vector2] = []
	for nw in range(1, 8):
		var i = col - nw
		if i < 0 or i > 7:
			break
		var j = row - nw
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	for ne in range(1, 8):
		var i = col + ne
		if i < 0 or i > 7:
			break
		var j = row - ne
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	for sw in range(1, 8):
		var i = col - sw
		if i < 0 or i > 7:
			break
		var j = row + sw
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	for se in range(1, 8):
		var i = col + se
		if i < 0 or i > 7:
			break
		var j = row + se
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	return squares
