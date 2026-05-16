extends Control

@onready var visor = $VisorTemperatura

@onready var s1 = $Slider1
@onready var s2 = $Slider2
@onready var s3 = $Slider3
@onready var s4 = $Slider4
@onready var s5 = $Slider5

@onready var barreira = $"../../PainelTermico/StaticBody2D/CollisionShape2D"

var puzzle_resolvido = false

func _ready():

	hide()

	process_mode = Node.PROCESS_MODE_ALWAYS

	barreira.disabled = true

func abrir_popup():

	show()

	print("Popup aberto")

func fechar_popup():

	hide()

	barreira.disabled = true

	print("Popup fechado")

func _process(_delta):

	var temperatura_total = (
		s1.value +
		s2.value +
		s3.value +
		s4.value +
		s5.value
	)

	Global.temperatura = temperatura_total

	visor.text = str(int(temperatura_total)) + "°"

	if temperatura_total >= 60 and not puzzle_resolvido:

		puzzle_resolvido = true

		print("Puzzle resolvido")

		await get_tree().create_timer(1.0).timeout

		fechar_popup()

func _on_botao_fechar_pressed():

	if puzzle_resolvido:
		fechar_popup()
		barreira.disabled = false
