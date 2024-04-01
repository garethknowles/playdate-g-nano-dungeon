GameScene = {}
class('GameScene').extends(NobleScene)
local scene = GameScene

scene.backgroundColor = Graphics.kColorBlack

scene.inputHandler = {
  AButtonDown = function()
    Noble.transition(GameOverScene, 1, Noble.Transition.SpotlightMask)
  end
}

function scene:init()
  scene.super.init(self)

  dungeon = Dungeon()
  self.turnManager = TurnManager()
end

function scene:start()
  local x = 13
  local y = 13
  self.player = Player(x, y)
  self.player:moveTo(16*x, 16*y)
  self:addSprite(self.player)
  self.turnManager:addEntitiy(self.player)
end

function scene:drawBackground(x, y, width, height)
  scene.super.drawBackground(self)

  dungeon:draw(x, y, width, height)
end

function scene:update()
  if self.turnManager:over() then
    self.turnManager:refresh()
  end
  self.turnManager:turn()
end


