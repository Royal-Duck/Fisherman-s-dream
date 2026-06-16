extends Control

func _ready() -> void:
	$Background/Columnus/Rows1/VSyncSelector.selected = int(Settings.vertical_sync)

func _on_v_sync_selector_item_selected(index: int) -> void:
	Settings.vertical_sync = bool($Background/Columnus/Rows1/VSyncSelector.get_item_id(index))
	Settings.save_settings()
