var customMapFormat = {
    name: "LOVE Tilemap",
    extension: "lua",

    write: function (map, fileName) {
        var m = fileName+"={data={tileWidth="+map.tileWidth+",tileHeight="+map.tileHeight+",width="+map.width
        m=m+",height="+map.height+"},layers={"
        
        
        for (var i = 0; i < map.layerCount; ++i) {
            var layer = map.layerAt(i);
            if (layer.isTileLayer) {
                var rows = "{";
                for (y = 0; y < layer.height; ++y) {
                    var row = "{";
                    for (x = 0; x < layer.width; ++x) {
                        row += (layer.cellAt(x, y).tileId);
                        var next = x == (layer.width-1) ? "}" : ",";
                        row += next

                    }
                    var next = y == (layer.height-1) ? "}" : ",";
                    rows += row;
                    rows += next;
                    
                }

            }

            m += rows;
            var next = i == (map.layerCount-1) ? "}" : ",";
            m += next;
            m += "}";
        }
        var file = new TextFile(fileName, TextFile.WriteOnly);
        file.write(m);
        file.commit();
    },
}

tiled.registerMapFormat("LOVE Tilemap", customMapFormat)