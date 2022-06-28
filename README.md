# RetroGameEngine
Retro game engine for Pharo Smalltalk.

It's strongly inspired by Pyxel.

https://github.com/kitao/pyxel

The resources of the sample program are the original ones.

## Install repository on Pharo (for developer)
It only supports Pharo 10.

```
Metacello new
    baseline: 'RetroGameEngine';
    repository: 'github://EiichiroIto/RetroGameEngine/src';
    load.
```

## Examples

```
SpRetroDemoPlayer example.
ImageEditor run.
TilemapEditor run.
Danmaku run.
```

Have fun!

## Limitations
- Sound and music functions are not supported.

## ToDo
- Support for Windows and Mac.
- Support for sound and music.
