# Tiled-Love2d-export-format
Tiled export format to a lua table with information and a tilemap.

Exports a tilemap as a lua table with the following format:
```
tilemap = {
  data = {tileWidth=16,tileHeight=16},
  layers = {
    {
      {1,0,23,43,2},
      {1,1,1,1,14}
    }
  
  }
}
```

The `example.lua` file contains a `renderToCanvas()` function that returns a love2d canvas with the tilemap rendered to it. Layers are rendered from the top down.
