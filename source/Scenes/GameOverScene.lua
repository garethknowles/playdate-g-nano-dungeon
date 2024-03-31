class('GameOverScene').extends(playdate.graphics.sprite)

function GameOverScene:init(text)
    local gameOverImage = playdate.graphics.image.new(playdate.graphics.getTextSize(text))
    playdate.graphics.pushContext(gameOverImage)
        playdate.graphics.drawText(text, 0, 0)
    playdate.graphics.popContext()
    gameOverSprite = playdate.graphics.sprite.new(gameOverImage)
    gameOverSprite:moveTo(0, 120)
    gameOverSprite:setCenter(0, 0)
    gameOverSprite:add()

    self:add()
end

function GameOverScene:update()
    gameOverSprite:moveTo((gameOverSprite.x + 3) % 400, gameOverSprite.y)

    if playdate.buttonJustPressed(playdate.kButtonA) then
        SCENE_MANAGER:switchScene(GameScene)
    end
end