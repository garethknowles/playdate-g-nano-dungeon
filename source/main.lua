import "~imports"

local gfx <const> = playdate.graphics

-- local function setup()
-- 	math.randomseed(playdate.getSecondsSinceEpoch())
-- 	playdate.display.setRefreshRate(30)
--
--   SCENE_MANAGER = SceneManager()
--   TILESET_MANAGER = TilesetManager()
--   GameScene()
-- end
--
-- function playdate.update()
--   playdate.timer.updateTimers()
-- 	gfx.sprite.update()
-- end

TILESET_MANAGER = TilesetManager()

Noble.Settings.setup({
  Difficulty = "Medium"
})

Noble.GameData.setup({
  Score = 0
})

Noble.showFPS = true

Noble.new(GameScene)
