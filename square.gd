class_name Square extends ColorRect

signal clicked(square: Square)

var col: int
var row: int
var piece: Node = null

func _ready() -> void:
	$Highlight.hide()
	$Select.hide()

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("clicked", self)

func set_piece(p: Node):
	if not piece:
		add_child(p)
		piece = p

func highlight(shown: bool):
	if shown:
		$Highlight.show()
	else:
		$Highlight.hide()

func select(shown: bool):
	if shown:
		$Select.show()
	else:
		$Select.hide()
