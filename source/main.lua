import "~imports"

local function setup()
	math.randomseed(playdate.getSecondsSinceEpoch())
	playdate.display.setRefreshRate(50)

  TILESET_MANAGER = TilesetManager()
end


Noble.showFPS = true

setup()
Noble.new(GameScene)
