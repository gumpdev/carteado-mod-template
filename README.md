# Carteado Mod Template

Carteado Mod Template is a Godot Project to you create a mod for the [Carteado Game](https://store.steampowered.com/app/3863510/)

## Table of contents

- [Mod Support](#Mod-Support)
- [Setup](#Setup)
- [Guides](#Guides)
	- [Skins](docs/SKINS.md)
- [Exporting](#Exporting)
- [Testing](#Testing)

## Mod Support

Currently Carteado supports mods that adds:

- [Skins](docs/SKINS.md)

## Setup

First of all, you need to rename the folder `res://mods/your-mod-name/` to the mod name

**Warning: All content of your mod need to be inside the folder `res://mods/your-mod-name/`**

## Guides

Some guide of how to add some features to the mod

- [Skins](docs/SKINS.md)

## Exporting

To export the mod you need to go to `Project > Export...`, then select `Export mod` and click on `Export PCK/Zip...` *Preferable exports in .pck*

**Warning: The mod file name needs to be your mod name, the same as the folder in `res://mods/your-mod-name/`**

## Testing

To testing you just need to add to the mod file on the game mods folder, localized on:

- Windows: `%APPDATA%\carteado\mods`
- MacOS: `~/Library/Application Support/carteado/mods`
- Linux: `~/.local/share/carteado/mods`

then just start the game!