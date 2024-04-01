class('Dungeon').extends()

function Dungeon:init()

	self:setupMap(room1)
end

function Dungeon:draw(x, y, width, height)
	-- local rect = playdate.geometry.rect.new(player.x, player.y, width, height)
	self.dungeonMap:draw(x, y)
end

function Dungeon:setupMap(mapLayout)
	self.dungeonMap = Graphics.tilemap.new()
	self.dungeonMap:setImageTable(TILESET_MANAGER.imageTable)
	self.dungeonMap:setTiles(TILESET_MANAGER:levelToTiles(mapLayout), table.getSize(mapLayout[1]))
end

function Dungeon:isWall(x, y)
	local tileAtDestination = dungeon.dungeonMap:getTileAtPosition(x, y)
	TILESET_MANAGER:isWall(tileAtDestination)
end
