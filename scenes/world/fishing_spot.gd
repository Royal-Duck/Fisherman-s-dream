extends Control

enum Phase { IDLE, THROWING, WAITING, QTE, WIN, LOSE }
var phase := Phase.IDLE

var sequence: Array[String] = []
var qte_step := 0

@onready var player: AnimatedSprite2D = $Overlay2D/Player
@onready var bite_timer: Timer = $BiteTimer
@onready var bite_label: Label = $Overlay2D/BiteLabel
@onready var win_label: Label = $Overlay2D/WinLabel
@onready var lose_label: Label = $Overlay2D/LoseLabel
@onready var arrows := {
	"up": $Overlay2D/ArrowUp,
	"down": $Overlay2D/ArrowDown,
	"left": $Overlay2D/ArrowLeft,
	"right": $Overlay2D/ArrowRight
}

func _ready() -> void:
	player.play("idle")
	bite_timer.one_shot = true
	player.animation_finished.connect(_on_animation_finished)
	bite_timer.timeout.connect(_on_bite_timer_timeout)
	arrows["up"].text = "↑"
	arrows["down"].text = "↓"
	arrows["left"].text = "←"
	arrows["right"].text = "→"
	bite_label.text = "ÇA MORD !"
	win_label.text = "WIN !"
	lose_label.text = "LOSE !"

func hide_all_arrows() -> void:
	for arrow in arrows.values():
		arrow.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if phase == Phase.IDLE:
		if event.is_action_pressed("fish_cast"):
			phase = Phase.THROWING
			player.play("cast")

	if phase == Phase.QTE:
		var dir := ""
		if event.is_action_pressed("qte_up"): dir = "up"
		elif event.is_action_pressed("qte_down"): dir = "down"
		elif event.is_action_pressed("qte_left"): dir = "left"
		elif event.is_action_pressed("qte_right"): dir = "right"
		if dir != "":
			check_qte_input(dir)

func _on_animation_finished() -> void:
	if phase == Phase.THROWING:
		phase = Phase.WAITING
		player.play("idle")
		bite_timer.wait_time = randf_range(2.0, 5.0)
		bite_timer.start()

func _on_bite_timer_timeout() -> void:
	phase = Phase.QTE
	sequence = []
	qte_step = 0
	for i in 3:
		sequence.append(["up", "down", "left", "right"].pick_random())
	bite_label.text = "ÇA MORD !"
	bite_label.visible = true
	await get_tree().create_timer(1.0).timeout
	bite_label.visible = false
	arrows[sequence[0]].visible = true

func check_qte_input(dir: String) -> void:
	if dir == sequence[qte_step]:
		hide_all_arrows()
		qte_step += 1
		if qte_step >= sequence.size():
			enter_win()
		else:
			arrows[sequence[qte_step]].visible = true
	else:
		enter_lose()

func enter_win() -> void:
	phase = Phase.WIN
	hide_all_arrows()
	win_label.text = "WIN !"
	win_label.visible = true
	await get_tree().create_timer(1.5).timeout
	win_label.visible = false
	phase = Phase.IDLE
	player.play("idle")

func enter_lose() -> void:
	phase = Phase.LOSE
	hide_all_arrows()
	lose_label.text = "LOSE !"
	lose_label.visible = true
	await get_tree().create_timer(1.5).timeout
	lose_label.visible = false
	phase = Phase.IDLE
	player.play("idle")
