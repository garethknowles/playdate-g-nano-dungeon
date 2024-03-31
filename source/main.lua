import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

local gfx <const> = playdate.graphics

local function setup()
	math.randomseed(playdate.getSecondsSinceEpoch())
	playdate.display.setRefreshRate(30)
end

function playdate.update()
	gfx.sprite.update()
  playdate.timer.updateTimers()
end

setup()
