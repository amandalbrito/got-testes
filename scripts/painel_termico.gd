extends Node2D

var player_near = false

@onready var popup = $"../PuzzleRelogio"
@onready var label = $LabelInteracao

func _ready():

	label.visible = false


func _process(_delta):
	if player_near:
		print("PLAYER PERTO")

	if player_near and Input.is_action_just_pressed("interact_cientista"):

		print("CTRL FUNCIONOU")

		popup.abrir_popup()

	if player_near and Input.is_action_just_pressed("interact_cientista"):

		popup.abrir_popup()


func _on_area_2d_area_entered(body):
	print("ENTROU AREA")

	if body.name == "Cientista":

		print("CIENTISTA DETECTADA")

		player_near = true
		label.visible = true
	pass # Replace with function body.


func _on_area_2d_area_exited(body):
	if body.name == "Cientista":
		player_near = false
		label.visible = false
	pass # Replace with function body.
