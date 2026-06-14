extends Node

const config_file_path = "user://settings.cfg"
var config_file := ConfigFile.new()

var max_fps : int = 60
var main_volume : float = 1.0
var music_volume : float = 1.0
var sfx_volume : float = 1.0

func apply_settings() -> void:
	Engine.max_fps = max_fps

func save_settings() -> void:
	config_file.set_value("Graphics", "MaxFPS", max_fps)
	config_file.set_value("Sound", "MainVolume", main_volume)
	config_file.set_value("Sound", "MusicVolume", music_volume)
	config_file.set_value("Sound", "SfxVolume", sfx_volume)
	config_file.save(config_file_path)
	apply_settings()

func load_settings() -> void:
	config_file.load(config_file_path)
	max_fps = config_file.get_value("Graphics", "MaxFPS")
	main_volume = config_file.get_value("Sound", "MainVolume")
	music_volume = config_file.get_value("Sound", "MusicVolume")
	sfx_volume = config_file.get_value("Sound", "SfxVolume")
	apply_settings()

func _ready() -> void:
	var err := config_file.load(config_file_path)
	if err != OK:
		config_file = ConfigFile.new()
		save_settings()
	else :
		load_settings()
