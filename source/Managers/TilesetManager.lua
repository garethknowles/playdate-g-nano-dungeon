class ('TilesetManager').extends()

function TilesetManager:init()
  self.imageTable = playdate.graphics.imagetable.new("assets/monochrome_packed")
end

function TilesetManager:getImageTable()
  return self.imageTable
end

function TilesetManager:levelToTiles(level)
  return map(flatten(level),
    function(item)
        if item == 1 then
            return 844
        else
            return 0
        end
    end
  )
end