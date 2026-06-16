extends Control

@export var advanced_graphics : PackedScene

var save_cooldown : float = 0.0

func _ready() -> void:
	Settings.load_settings()
	$Columnus/Rows1/MainVolumeSlider.value = Settings.main_volume
	$Columnus/Rows1/MusicVolumeSlider.value = Settings.music_volume
	$Columnus/Rows1/SfxVolumeSlider.value = Settings.sfx_volume
	for index in range($Columnus/Rows1/MaxFPSSelector.item_count):
		if $Columnus/Rows1/MaxFPSSelector.get_item_text(index) == str(Settings.max_fps):
			$Columnus/Rows1/MaxFPSSelector.selected = index

func _on_max_fps_selector_item_selected(index: int) -> void:
	Settings.max_fps = int($Columnus/Rows1/MaxFPSSelector.get_item_text(index))
	Settings.save_settings()


func _on_main_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Settings.main_volume = $Columnus/Rows1/MainVolumeSlider.value
		Settings.save_settings()

func _on_music_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Settings.music_volume = $Columnus/Rows1/MusicVolumeSlider.value
		Settings.save_settings()

func _on_sfx_volume_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		Settings.sfx_volume = $Columnus/Rows1/SfxVolumeSlider.value
		Settings.save_settings()

func _on_advanced_graphics_button_pressed() -> void:
	GameState.switch_to_menu(get_tree().current_scene, advanced_graphics)
