Player = {}
class('Player').extends(NobleSprite)

function Player:init(x, y)
	local image = TILESET_MANAGER:getPlayerImage()
	Player.super.init(self, image)
	self.movementPoints = 1
	self.x = x
	self.y = y
	self:setCenter(0,0)
end

function Player:refresh()
	self.movementPoints = 1
end

function Player:turn()
	local oldX = self.x
	local oldY = self.y
	local moved = false

	if self.movementPoints > 0 then
		if playdate.buttonIsPressed(playdate.kButtonLeft) then
			self.x -= 16
			print("Moving left: " .. self.x)
			moved = true
		end
		if playdate.buttonIsPressed(playdate.kButtonRight) then
			self.x += 16
			print("Moving right: " .. self.x)
			moved = true
		end
		if playdate.buttonIsPressed(playdate.kButtonUp) then
			self.y -= 16
			print("Moving up: " .. self.y)
			moved = true
		end
		if playdate.buttonIsPressed(playdate.kButtonDown) then
			self.y += 16
			print("Moving down: " .. self.y)
			moved = true
		end

		if moved == true then
			self.movementPoints -= 1
		else
			return
		end

		-- wall collision check
		local isWall = dungeon:isWall(self.x/16, self.y/16)
		if isWall then
			self.x = oldX
			self.y = oldY
			return
		end

		self:moveTo(self.x, self.y)
	end
end

function Player:over()
	return self.movementPoints == 0
end