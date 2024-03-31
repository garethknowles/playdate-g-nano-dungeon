import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "Managers/SceneManager"
import "Scenes/GameScene"

local gfx <const> = playdate.graphics


local function setup()
	math.randomseed(playdate.getSecondsSinceEpoch())
	playdate.display.setRefreshRate(30)

  SCENE_MANAGER = SceneManager()
  GameScene()
end

function playdate.update()
  playdate.timer.updateTimers()
	gfx.sprite.update()
end

setup()
