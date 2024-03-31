
class('GameScene').extends(playdate.graphics.sprite)

function GameScene:setupMap()
    local level = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    }
    levelMap = playdate.graphics.tilemap.new()
    levelMap:setImageTable(TILESET_MANAGER.imageTable)
    levelMap:setTiles(TILESET_MANAGER:levelToTiles(level), 10)
end

function GameScene:init()
    self:setupMap()

    self:setCenter(0, 0)
    self.setBackgroundDrawingCallback(
        function(x, y, width, height)
            levelMap:draw(0, 0)
        end
    )

    local playerSprite = TILESET_MANAGER.imageTable:getImage(25, 1)
    self.player = playdate.graphics.sprite.new(playerSprite)
    self.player:moveTo(0, 0)
    self.player:setCenter(0, 0)
    self.player:add()
    
    self.playerSpeed = 16

    self:add()
end

function GameScene:update()
    if playdate.buttonJustPressed(playdate.kButtonA) then
        SCENE_MANAGER:switchScene(GameOverScene, "Game Over Scene")
        return
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