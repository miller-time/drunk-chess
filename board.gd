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

func _on_piece_clicked(p: Node):
	# clear existing select/highlight
	for sq in squares:
		sq.select(false)
		sq.highlight(false)

	var s = get_square(p.col, p.row)
	s.select(true)
	var reachable = p.reachable_squares()
	for r in reachable:
		s = get_square(r.x, r.y)
		s.highlight(true)

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
	var index = row * 8 + col
	return squares[index]

func setup_pieces():
	var j = 0
	var s: Square
	for i in [0, 7]:
		s = get_square(i, j)
		var rook = black_rook.instantiate()
		rook.set_pos(i, j)
		rook.clicked.connect(_on_piece_clicked)
		s.set_piece(rook)

	for i in [1, 6]:
		s = get_square(i, j)
		var knight = black_knight.instantiate()
		knight.set_pos(i, j)
		knight.clicked.connect(_on_piece_clicked)
		s.set_piece(knight)

	for i in [2, 5]:
		s = get_square(i, j)
		var bishop = black_bishop.instantiate()
		bishop.set_pos(i, j)
		bishop.clicked.connect(_on_piece_clicked)
		s.set_piece(bishop)

	s = get_square(3, j)
	var queen = black_queen.instantiate()
	queen.set_pos(3, j)
	queen.clicked.connect(_on_piece_clicked)
	s.set_piece(queen)
	
	s = get_square(4, j)
	var king = black_king.instantiate()
	king.set_pos(4, j)
	king.clicked.connect(_on_piece_clicked)
	s.set_piece(king)

	j = 1
	for i in range(8):
		s = get_square(i, j)
		var pawn = black_pawn.instantiate()
		pawn.set_pos(i, j)
		pawn.clicked.connect(_on_piece_clicked)
		s.set_piece(pawn)

	j = 6
	for i in range(8):
		s = get_square(i, j)
		var pawn = white_pawn.instantiate()
		pawn.set_pos(i, j)
		pawn.clicked.connect(_on_piece_clicked)
		s.set_piece(pawn)

	j = 7
	for i in [0, 7]:
		s = get_square(i, j)
		var rook = white_rook.instantiate()
		rook.set_pos(i, j)
		rook.clicked.connect(_on_piece_clicked)
		s.set_piece(rook)

	for i in [1, 6]:
		s = get_square(i, j)
		var knight = white_knight.instantiate()
		knight.set_pos(i, j)
		knight.clicked.connect(_on_piece_clicked)
		s.set_piece(knight)

	for i in [2, 5]:
		s = get_square(i, j)
		var bishop = white_bishop.instantiate()
		bishop.set_pos(i, j)
		bishop.clicked.connect(_on_piece_clicked)
		s.set_piece(bishop)

	s = get_square(3, j)
	queen = white_queen.instantiate()
	queen.set_pos(3, j)
	queen.clicked.connect(_on_piece_clicked)
	s.set_piece(queen)
	
	s = get_square(4, j)
	king = white_king.instantiate()
	king.set_pos(4, j)
	king.clicked.connect(_on_piece_clicked)
	s.set_piece(king)
