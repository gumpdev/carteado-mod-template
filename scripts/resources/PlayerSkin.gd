class_name PlayerSkin extends Resource

@export var id: String
@export var icon: Texture2D
@export var texture: Texture2D
@export var texture_size: Vector2 = Vector2(16, 16)
@export var offset: Vector2 = Vector2(-1, -1)
@export var unlock: String = ""
@export_group("Sounds")
@export var time_to_idle: float
@export var idle_sfx: AudioStream
@export var walk_sfx: AudioStream
@export var damage_sfx: AudioStream
@export var attack_sfx: AudioStream
@export var no_cards_sfx: AudioStream
@export_group("Translations")
@export var name_translation: Dictionary[String, String] = {"en": ""}
@export var unlock_translation: Dictionary[String, String] = {"en": ""}
@export var description_translation: Dictionary[String, String] = {"en": ""}
