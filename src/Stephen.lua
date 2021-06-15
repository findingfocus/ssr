Stephen = Class{}

PLAYER_SPEED = 650
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
	self.winState = false
	psystem1 = love.graphics.newParticleSystem(particle, 50)
	psystem2 = love.graphics.newParticleSystem(particle, 50)

	psystem1:setParticleLifetime(1, 4)
	psystem1:setEmissionRate(0)
	psystem1:setSizeVariation(1)
	psystem1:setLinearAcceleration(-30, -40, 20, 0)
	psystem1:setColors(1, 1, 1, 1, 1, 1, 1, 0)
	psystem1:setEmissionArea('normal', 10, 0)

	psystem2:setParticleLifetime(1, 4)
	psystem2:setEmissionRate(0)
	psystem2:setSizeVariation(1)
	psystem2:setLinearAcceleration(-30, -40, 20, 0)
	psystem2:setColors(1, 1, 1, 1, 1, 1, 1, 0)
	psystem2:setEmissionArea('normal', 10, 0)
end

function Stephen:collides(weiner)
	if self.x >=  weiner.x + weiner.width or weiner.x >= self.x + self.width then
		return false
	end

	if self.y >= weiner.y + weiner.height or weiner.y >= self.y + self.height then
		return false
	end

	return true
end

function Stephen:reset()
	self.x = 0
	self.y = GROUND_FLOOR_STEPHENY
	self.width = 200
	self.height = 130
	self.topLevel = false
	self.winState = false
end


function Stephen:update(dt)


	psystem1:update(dt)
	psystem2:update(dt)
	psystem1:setEmissionRate(0)
	psystem2:setEmissionRate(0)

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
				--insert particles
				psystem1:setEmissionRate(850)
				self.x = VIRTUAL_WIDTH - 680
			end
		else
			--Stephens right clamping behavior
			if stephen.winState and stephen.x == 0 then
				stephen.x = 0
			else
				self.x = math.min(VIRTUAL_WIDTH - self.width - 80, self.x + PLAYER_SPEED * dt)
			end

			--burnt toes
			if self.x == VIRTUAL_WIDTH - self.width - 80 then 
				psystem2:setEmissionRate(850) 
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
		self.y = math.min(GROUND_FLOOR_STEPHENY, self.y + PLAYER_SPEED * dt)
		if self.y >= GROUND_FLOOR_STEPHENY then
			self.topLevel = false
			onLadder = false
		end
	end

	--triggers winState
	if topWeiner.x == 880 and bottomWeiner.x > 1140 then
		self.winState = true
	end

end

function Stephen:render()

	love.graphics.draw(psystem1, VIRTUAL_WIDTH - (PLATE_WIDTH * 6) + 40, TOP_FLOORY - 5)

	love.graphics.draw(psystem2, VIRTUAL_WIDTH - self.width - 80, VIRTUAL_HEIGHT - FLOOR_HEIGHT)

	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.draw(self.image, self.x, self.y + 18)
end