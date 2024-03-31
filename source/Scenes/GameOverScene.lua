class('GameOverScene').extends(playdate.graphics.sprite)

function GameOverScene:init(text)
    -- local text = "Game Over"
    local gameOverImage = playdate.graphics.image.new(playdate.graphics.getTextSize(text))
    playdate.graphics.pushContext(gameOverImage)
        playdate.graphics.drawText(text, 0, 0)
    playdate.graphics.popContext()
    local gameOverSprite = playdate.graphics.sprite.new(gameOverImage)
    gameOverSprite:moveTo(200, 120)
    gameOverSprite:add()

    self:add()
end

function GameOverScene:update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        SCENE_MANAGER:switchScene(GameScene)
    end
end