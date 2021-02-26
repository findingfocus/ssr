Stephen = Class{}

PLAYER_SPEED = 350
local grounded = true
local ladderArea = false
local onLadder = false
local topLevel = false

function Stephen:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
end

function Stephen:update(dt)

	if self.x > 210 and self.x < 230 then
		ladderArea = true
	else
		ladderArea = false
	end

	if love.keyboard.isDown('left') and not onLadder then

		if topLevel == true then
			self.x = math.max(220 ,self.x - PLAYER_SPEED * dt)
		else
			self.x = math.max(0, self.x - PLAYER_SPEED * dt)
		end
	end

	if love.keyboard.isDown('right') and not onLadder then
		self.x = math.min(VIRTUAL_WIDTH - self.width, self.x + PLAYER_SPEED * dt) 
	end

	if love.keyboard.isDown('up') and ladderArea then
		onLadder = true
		self.x = 220



		-- detects if on top floor
		if self.y == 30 then
			topLevel = true
			onLadder = false
		end

		self.y = math.max(30, self.y - PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('down') and ladderArea then
		onLadder = true
		self.x = 220
		if self.y == VIRTUAL_HEIGHT - 220 then
			topLevel = false
			onLadder = false
		end
		self.y = math.min(VIRTUAL_HEIGHT - 220,self.y + PLAYER_SPEED * dt)
	end

end

function Stephen:render()
	love.graphics.setColor(255/255, 50/255, 50/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end