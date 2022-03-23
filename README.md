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

## Limitations
- Only compatible with Pharo 8.
- Sound and music functions are not supported.
- Bitmap editor or Tile editor are not implemented.

Have fun!
