@tool
class_name StackedSprites extends CanvasGroup

@export var texture: Texture2D: set = _set_texture
@export var texture_size: Vector2 = Vector2(16, 16): set = _set_texture_size
@export var rot: float = 0: set = _set_rotation
@export var mat: Material: set = _set_material
@export var z_index_size: float = 1

@export_group("Offset")
@export var offset: Vector2: set = _set_offset
@export var rotation_offset: float
@export var rio: Array = []

@export_group("See through")
@export var see_through = false: set = _set_see_through

func _set_material(_material: Material):
	mat = _material
	_update_sprite()

func _set_rotation(_rotation: float):
	rot = _rotation
	_update_rotation()

func get_rotation_individual_offset(i: int):
	if rio.size() > i:
		return rio[i]
	return 0

func _set_texture(_texture: Texture2D):
	texture = _texture
	_update_sprite()

func _set_texture_size(_texture_size: Vector2):
	texture_size = _texture_size
	_update_sprite()

func _set_offset(_offset: Vector2):
	offset = _offset
	_update_sprite()

func _ready() -> void:
	_update_sprite()

func _remove_sprites():
	for child in get_children():
		child.queue_free()

func _update_rotation():
	var i = 0
	for child in get_children():
		var weight = get_rotation_individual_offset(i)
		child.rotation = (rot + deg_to_rad(rotation_offset)) + weight
		i += 1

func _render_sprites():
	for i in range(texture.get_width() / texture_size.x):
		var sprite2d = Sprite2D.new()
		var atlas = AtlasTexture.new()
		atlas.atlas = texture
		atlas.region.size = texture_size
		atlas.region.position.x = i * texture_size.x
		sprite2d.texture = atlas
		sprite2d.y_sort_enabled = true
		sprite2d.z_index = i * z_index_size
		sprite2d.material = mat
		add_child(sprite2d)
		sprite2d.position = i * offset

func _update_sprite():
	_remove_sprites()
	_render_sprites()
	_update_rotation()

var tween: Tween
func _set_see_through(_value: bool):
	see_through = _value
	if tween:
		tween.stop()
	tween = create_tween()
	tween.tween_property(self, "modulate:a", 0.1 if see_through else 1.0, 0.25)