class_name Queen extends Piece

func reachable_squares(col: int, row: int) -> Array[Vector2]:
	var squares: Array[Vector2] = []
	# squares along NW diagonal
	for nw in range(1, 8):
		var i = col - nw
		if i < 0 or i > 7:
			break
		var j = row - nw
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	# squares along NE diagonal
	for ne in range(1, 8):
		var i = col + ne
		if i < 0 or i > 7:
			break
		var j = row - ne
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	# squares along SW diagonal
	for sw in range(1, 8):
		var i = col - sw
		if i < 0 or i > 7:
			break
		var j = row + sw
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	# squares along SE diagonal
	for se in range(1, 8):
		var i = col + se
		if i < 0 or i > 7:
			break
		var j = row + se
		if j < 0 or j > 7:
			break
		squares.push_back(Vector2(i, j))
	# squares along this rank
	for i in range(8):
		if i != col:
			squares.push_back(Vector2(i, row))
	# squares along this file
	for j in range(8):
		if j != row:
			squares.push_back(Vector2(col, j))
	return squares
