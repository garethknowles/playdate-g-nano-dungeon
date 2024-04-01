import "~imports"

local gfx <const> = playdate.graphics

local function setup()
	math.randomseed(playdate.getSecondsSinceEpoch())
	playdate.display.setRefreshRate(30)

  SCENE_MANAGER = SceneManager()
  TILESET_MANAGER = TilesetManager()
  GameScene()
end

function playdate.update()
  playdate.timer.updateTimers()
	gfx.sprite.update()
end

setup()
