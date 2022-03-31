extends Control

var matches = []

var places = [
	"Atkins", "Barnard", "Belk Gym", "Bioinformatics",
	"Burson", "Cameron Hall", "Cato", "Charlotte Engineering Early College",
	"College of Health and Human Services", "Colvard", "Denny", "Duke Centennial Hall",
	"EPIC", "Fretwell", "Friday", "Garinger", "Grigg Hall", "Johnson Band Center",
	"Kulwicki Laboratory", "Macy", "McEniry", "Memorial Hall", "Motorsports Research",
	"PORTAL", "Robinson Hall", "Rowe", "Science Building", "Smith", "Storrs",
	"Winningham", "Woodward"
]

onready var items = $ScrollContainer/VBoxContainer.get_children()
onready var items2 = $ScrollContainer2/VBoxContainer.get_children()


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in items:
		i.hide();
		
	for i in items2:
		i.hide();


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartSearchBar_text_changed(new_text):
	new_text = new_text.to_lower()
	if new_text == "":
		for i in items:
			i.hide()
		return
	matches.clear()
	for i in places:
		if new_text in i.to_lower():
			matches.append(i)
	for j in items:
		if j.get_index() < len(matches):
			j.text = matches[j.get_index()]
		else:
			j.text = ""
	for i in items:
		i.show() if i.text in matches else i.hide()


func _on_EndSearchBar_text_changed(new_text):
	new_text = new_text.to_lower()
	if new_text == "":
		for i in items2:
			i.hide()
		return
	matches.clear()
	for i in places:
		if new_text in i.to_lower():
			matches.append(i)
	for j in items2:
		if j.get_index() < len(matches):
			j.text = matches[j.get_index()]
		else:
			j.text = ""
	for i in items2:
		i.show() if i.text in matches else i.hide()


func _on_Button_pressed_Start(extra_arg_0):
	var path = get_node("ScrollContainer/VBoxContainer/" + extra_arg_0)
	$StartSearchBar.text = path.get_text()
	for i in items:
		i.hide();


func _on_Button_pressed_End(extra_arg_0):
	var path = get_node("ScrollContainer2/VBoxContainer/" + extra_arg_0)
	$EndSearchBar.text = path.get_text()
	for i in items2:
		i.hide();
