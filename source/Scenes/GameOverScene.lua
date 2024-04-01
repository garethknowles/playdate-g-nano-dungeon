class('GameOverScene').extends(NobleScene)
local scene = GameOverScene

function scene:init()
    scene.super.init(self)

    local text = "Game Over Scene"

    local gameOverImage = Graphics.image.new(Graphics.getTextSize(text))
    Graphics.pushContext(gameOverImage)
        Noble.Text.draw(text, 0, 0)
    Graphics.popContext()
    gameOverSprite = Graphics.sprite.new(gameOverImage)
    gameOverSprite:moveTo(0, 120)
    gameOverSprite:setCenter(0, 0)

    self:addSprite(gameOverSprite)
end

function scene:update()
    scene.super.update(self)

    gameOverSprite:moveTo((gameOverSprite.x + 3) % 400, gameOverSprite.y)

    if playdate.buttonJustPressed(playdate.kButtonA) then
        Noble.transition(GameScene, 1, Noble.Transition.CrossDissolve)
    end
end