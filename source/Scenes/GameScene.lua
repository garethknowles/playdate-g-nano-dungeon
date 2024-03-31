import "GameOverScene"

class('GameScene').extends(playdate.graphics.sprite)

function GameScene:init()
    local backgroundImage = playdate.graphics.image.new("images/background")
    playdate.graphics.sprite.setBackgroundDrawingCallback(function()
        backgroundImage:draw(0, 0)
    end)

    local playerSprite = playdate.graphics.image.new("images/player")
    self.player = playdate.graphics.sprite.new(playerSprite)
    self.player:moveTo(200, 120)
    self.player:add()

    self.playerSpeed = 2

    self:add()
end

function GameScene:update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        SCENE_MANAGER:switchScene(GameOverScene, "Score: 100")
    end

    if playdate.buttonIsPressed(playdate.kButtonUp) then
        self.player:moveBy(0, -self.playerSpeed)
    end
    if playdate.buttonIsPressed(playdate.kButtonRight) then
        self.player:moveBy(self.playerSpeed, 0)
    end
    if playdate.buttonIsPressed(playdate.kButtonDown) then
        self.player:moveBy(0, self.playerSpeed)
    end
    if playdate.buttonIsPressed(playdate.kButtonLeft) then
        self.player:moveBy(-self.playerSpeed, 0)
    end
end