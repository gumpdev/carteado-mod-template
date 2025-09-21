# Skins

Skin on the carteado is a player skin.

## Table of contents

- [What is a Stacked Sprite](#What-is-a-Stacked-Sprite)
- [How to sprite a Skin](#How-to-sprite-a-Skin)
- [How to create a Skin](#How-to-create-a-Skin)
- [How to add sound to a Skin](#How-to-create-a-Skin)
- [How to add translations to a Skin](#How-to-translations-a-Skin)
- [How to unlock a Skin](#How-to-unlock-a-Skin)
- [How to register the Skin](How-to-register-the-Skin)

## What is a Stacked Sprite

A stacked sprite is a set of sprites stacked on top of each other, creating a 3D effect.

[A article talking about Stacked Sprite](https://www.connorwolf.com/post/sprite-stacking-in-godot)

## How to sprite a Skin

So to add a skin you need two sprites: a skin icon and the skin

Recommended size for skin icon and the skin is `16x16`

### Icon

Will be a sprite that will show in the play menu, usually will be the face of the skin

### Skin

Will be a [stacked sprite](#What-is-a-Stacked-Sprite), that will be the player skin, because of it, animations will be applied automatically

Usually you want to create your skin in `A-pose`.
The first 3 layers is the legs and the layers 4 to 7 is the hands

Animations that already have in the game:
- Walking
- Shooting card with right hand
- Shooting card with left hand
- Taking a hit
- Dying

for the skin **exports the sprite as a sprite sheet in horizontal**

## How to create a Skin

You just need to create a resource of the type `PlayerSkin`

- `id` is an unique name for the skin *(use camel_case)*
- `icon` is a texture of the skin icon
- `texture` is the skin sprite sheet
- `texture_size` is the skin texture size for each layer *(usually will be 16x16)*
- `offset` is the position offset of each layer *(default is -1, -1)*
- `unlock` is a string that will be used to unlock the skin, if is empty the skin will be unlocked by default *(see more on [How to unlock a Skin](#How-to-unlock-a-Skin))*
- `sounds` is the sounds of the skin *(see more on [How to add sound to a Skin](#How-to-create-a-Skin))*
- `translations` is the translations for each language of your skin, you need at least add the `en` translation, that is the fallback for the others languages *(see more on [How to add translations to a Skin](#How-to-translations-a-Skin))*

## How to add sound to a Skin

You can change the sounds of the skin

### Idle

You need to fill `time_to_idle` and `idle_sfx`.

- `time_to_idle` is the time in secounds, for how offen the skin will play the idle sound
- `idle_sfx` is the idle sound

### Walk

Walk you just need to fill `walk_sfx` that will be played for each step the player gives *(if it is null will use the male sounds by default)*

### Damage

Damage you just need to fill `damage_sfx` that will be played for each damage that the player receive *(if it is null will use the male sounds by default)*

### Attack

Attack you just need to fill `attack_sfx` that will be played for each player attack *(if it is null will use the male sounds by default)*

### No Cards

No Cards you just need to fill `no_cards_sfx` that will be played when the player tries to attack without an card in the hand *(if it is null will use the male sounds by default)*

## How to add translations to a Skin

translations is the text that will be showed to the player about the skin, on the resource is a dictionary, key is the language key, and the value is the text, so we have:

- `name_translation` is the name of the skin
- `unlock_translation` is the text of how to unlock the skin
- `description_translation` is the description of the skin

Currently we have the languages:
- `en` is English
- `br` is Brazilian Portuguese
- `es` is Latin Spanish

**Warning: you need to at least create a translation for `en`, because is the fallback for the others languages**

## How to unlock a Skin

You can unlock a skin by calling `Skins.unlock_skins(unlock_id: String)`.

`unlock_id` is a key that you add on the `unlock` field on the PlayerSkin resource

## How to register the Skin

So after all you need to register the skin in the game, so go to `res://mods/{your-mod-name}/mod.gd` and add the register on the `_ready`:

### Registring one skin

```gdscript
Skins.register_skin(load("res://mods/your-mod-name/skins/example.tres"))
```

### Registring two or more skins

```gdscript
Skins.register_skins([
	load("res://mods/your-mod-name/skins/example.tres"),
	load("res://mods/your-mod-name/skins/example2.tres")
])
```