Stephen = Class{}

PLAYER_SPEED = 950
local grounded = true
local ladderArea = false
local onLadder = false

function Stephen:init(x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	self.fallen = false
	self.topLevel = false
	self.image = love.graphics.newImage('/pictures/SSR_Stephen.png')
end

function Stephen:collides(weiner)
	if self.x > weiner.x + weiner.width or weiner.x > self.x + self.width then
		return false
	end

	if self.y > weiner.y + weiner.height or weiner.y > self.y + self.height then
		return false
	end

	return true
end

function Stephen:reset()
	self.x = 0
	self.y = VIRTUAL_HEIGHT - 220
	self.width = 200
	self.height = 130
	self.topLevel = false
end

function Stephen:update(dt)

	if self.x > 210 and self.x < 230 then
		ladderArea = true
	else
		ladderArea = false
	end

	if love.keyboard.isDown('left') and not onLadder then

		if self.topLevel == true then
			self.x = math.max(220 ,self.x - PLAYER_SPEED * dt)
		else
			self.x = math.max(0, self.x - PLAYER_SPEED * dt)
		end
	end

	if love.keyboard.isDown('right') and not onLadder then
		--kickback for burnt toes
		if self.topLevel == true then
			self.x = math.min(VIRTUAL_WIDTH - 575, self.x + PLAYER_SPEED * dt)
			if self.x == VIRTUAL_WIDTH - 575 then
				self.x = VIRTUAL_WIDTH - 680
			end
		else
			self.x = math.min(VIRTUAL_WIDTH - self.width - 80, self.x + PLAYER_SPEED * dt)
			if self.x == VIRTUAL_WIDTH - self.width - 80 then  
				self.x = VIRTUAL_WIDTH - self.width - 185
			end

		end

	end

	if love.keyboard.isDown('up') and ladderArea then
		onLadder = true
		self.x = 220

		-- detects if on top floor
		if self.y == 30 then
			self.topLevel = true
			onLadder = false
		end

		self.y = math.max(30, self.y - PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('down') and ladderArea then
		onLadder = true
		self.x = 220
		if self.y == GROUND_FLOOR_STEPHENY then
			self.topLevel = false
			onLadder = false
		end
		self.y = math.min(GROUND_FLOOR_STEPHENY, self.y + PLAYER_SPEED * dt)
	end

end

function Stephen:render()
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.draw(self.image, self.x, self.y + 18)
end