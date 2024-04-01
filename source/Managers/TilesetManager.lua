class ('TilesetManager').extends()

-- Index of Tiles
local BLANK = 1
local WALL_INDEX = 844
local PLAYER_INDEX = 418

function TilesetManager:init()
  self.imageTable = playdate.graphics.imagetable.new("assets/monochrome_packed")
end

function TilesetManager:getImageTable()
  return self.imageTable
end

function TilesetManager:getPlayerImage()
  return self.imageTable:getImage(PLAYER_INDEX)
end

function TilesetManager:levelToTiles(level)
  return map(flatten(level),
    function(item)
        if item == 1 then
            return WALL_INDEX
        else
            return BLANK
        end
    end
  )
end