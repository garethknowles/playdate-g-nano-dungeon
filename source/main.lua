import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "utils/tables"

import "managers/SceneManager"
import "managers/TilesetManager"

import "scenes/GameScene"
import "scenes/GameOverScene"

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
