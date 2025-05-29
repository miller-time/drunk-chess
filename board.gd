extends GridContainer

# 624a15
@export var dark_square_color: Color
# afa076
@export var light_square_color: Color

@export var square: PackedScene
@export var black_rook: PackedScene
@export var black_knight: PackedScene
@export var black_bishop: PackedScene
@export var black_queen: PackedScene
@export var black_king: PackedScene
@export var black_pawn: PackedScene
@export var white_pawn: PackedScene
@export var white_rook: PackedScene
@export var white_knight: PackedScene
@export var white_bishop: PackedScene
@export var white_queen: PackedScene
@export var white_king: PackedScene

var column_labels = {
	0: "A",
	1: "B",
	2: "C",
	3: "D",
	4: "E",
	5: "F",
	6: "G",
	7: "H"
}

var squares: Array[Square] = []

func _ready() -> void:
	create_squares()
	setup_pieces()

func _on_square_clicked(s: Square):
	print("square ", s.name, " was clicked")

func create_squares():
	for i in range(8):
		for j in range(8):
			var s = square.instantiate()
			var column_label = column_labels[i]
			var row_label = str(j + 1)
			s.set_name(column_label + row_label)
			s.color = square_color(i, j)
			s.clicked.connect(_on_square_clicked)
			squares.push_back(s)
			add_child(s)

func square_color(col: int, row: int) -> Color:
	if col % 2 == 0:
		if row % 2 == 0:
			return light_square_color
		else:
			return dark_square_color
	else:
		if row % 2 == 0:
			return dark_square_color
		else:
			return light_square_color

func get_square(col: int, row: int) -> Square:
	var index = col * 8 + row
	return squares[index]

func setup_pieces():
	var i = 0
	var s: Square
	for j in [0, 7]:
		s = get_square(i, j)
		var rook = black_rook.instantiate()
		rook.set_pos(i, j)
		s.set_piece(rook)

	for j in [1, 6]:
		s = get_square(i, j)
		var knight = black_knight.instantiate()
		knight.set_pos(i, j)
		s.set_piece(knight)

	for j in [2, 5]:
		s = get_square(i, j)
		var bishop = black_bishop.instantiate()
		bishop.set_pos(i, j)
		s.set_piece(bishop)

	s = get_square(i, 3)
	var queen = black_queen.instantiate()
	queen.set_pos(i, 3)
	s.set_piece(queen)
	
	s = get_square(i, 4)
	var king = black_king.instantiate()
	king.set_pos(i, 4)
	s.set_piece(king)

	i = 1
	for j in range(8):
		s = get_square(i, j)
		var pawn = black_pawn.instantiate()
		pawn.set_pos(i, j)
		s.set_piece(pawn)

	i = 6
	for j in range(8):
		s = get_square(i, j)
		var pawn = white_pawn.instantiate()
		pawn.set_pos(i, j)
		s.set_piece(pawn)

	i = 7
	for j in [0, 7]:
		s = get_square(i, j)
		var rook = white_rook.instantiate()
		rook.set_pos(i, j)
		s.set_piece(rook)

	for j in [1, 6]:
		s = get_square(i, j)
		var knight = white_knight.instantiate()
		knight.set_pos(i, j)
		s.set_piece(knight)

	for j in [2, 5]:
		s = get_square(i, j)
		var bishop = white_bishop.instantiate()
		bishop.set_pos(i, j)
		s.set_piece(bishop)

	s = get_square(i, 3)
	queen = white_queen.instantiate()
	queen.set_pos(i, 3)
	s.set_piece(queen)
	
	s = get_square(i, 4)
	king = white_king.instantiate()
	king.set_pos(i, 4)
	s.set_piece(king)
