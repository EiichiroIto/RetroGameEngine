# RetroGameEngine
Retro game engine for Pharo Smalltalk.

It's strongly inspired by Pyxel.

https://github.com/kitao/pyxel

The resources of the sample program are the original ones.

## Install repository on Pharo (for developer)
Currently, it only supports Pharo 8. 

```
Metacello new
    baseline: 'RetroGameEngine';
    repository: 'github://EiichiroIto/RetroGameEngine/src';
    load.
```

## Examples

```
SpRetroDemoPlayer example.
```

Have fun!

## Limitations
- Only compatible with Pharo 8.
- Sound and music functions are not supported.
- Image Editor and Tilemap Editor are not implemented.

## ToDo
- Implement Image Editor by RetroGameEngine itself.
- Implement Tilemap Editor by RetroGameEngine itself.
- Support for Pharo 10.
- Support for sound and music.
