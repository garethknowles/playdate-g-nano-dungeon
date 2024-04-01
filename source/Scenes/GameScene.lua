GameScene = {}
class('GameScene').extends(NobleScene)
local scene = GameScene

scene.backgroundColor = Graphics.kColorBlack

player = {}
scene.inputHandler = {
    AButtonDown = function()
        Noble.transition(GameOverScene, 1, Noble.Transition.SpotlightMask)
    end,

    upButtonDown = function()
        player:moveBy(0, -playerSpeed)
    end,

    rightButtonDown = function()
        player:moveBy(playerSpeed, 0)
    end,

    downButtonDown = function()
        player:moveBy(0, playerSpeed)
    end,

    leftButtonDown = function()
        player:moveBy(-playerSpeed, 0)
    end
}

function scene:setupMap()
    local level = {
        {1, 1, 1, 1, 1,  1, 1, 1, 1, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 1, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 1, 0, 0, 1},
        {1, 0, 0, 0, 0,  0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1,  1, 1, 1, 1, 1},
    }
    self.levelMap = Graphics.tilemap.new()
    self.levelMap:setImageTable(TILESET_MANAGER.imageTable)
    self.levelMap:setTiles(TILESET_MANAGER:levelToTiles(level), 10)
end

function scene:init()
    scene.super.init(self)

    self:setupMap()

    player = Graphics.sprite.new(TILESET_MANAGER:getPlayerImage())
    player:moveTo(0, 0)
    player:setCenter(0, 0)
    self:addSprite(player)

    playerSpeed = 16
end

function scene:drawBackground(__x, __y, __width, __height)
    scene.super.drawBackground(self)

    self.levelMap:draw(0, 0)
end

function scene:update()
    scene.super.update(self)

end

