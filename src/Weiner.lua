Weiner = Class{}

local fallSpeed = 600

function Weiner:init(x, y, width, height)
	self.width = 90
	self.height = 90
	self.x = x
	self.y = y
	pushedOff = false
	SPAWNX = x
	SPAWNY = y
end

function Weiner:topReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - 380 - (3 * PLATE_WIDTH)
	self.y = stephen.height + 30 - PLATE_WIDTH
end

function Weiner:bottomReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - 380 - (2* PLATE_WIDTH)
	self.y = VIRTUAL_HEIGHT - 190
end

function Weiner:update(dt)

	--update self.x if stephen.x + steven.width > self.x

	if self.pushedOff then
		self.x = VIRTUAL_WIDTH - 380
		self.y = math.min(VIRTUAL_HEIGHT - self.height, self.y + fallSpeed * dt)
	else
		if stephen.x + stephen.width > self.x and self.y > stephen.y - stephen.height then
			self.x = stephen.x + stephen.width
		end
	end	

---[[
	if self.x > VIRTUAL_WIDTH - 380 then
		self.pushedOff = true
		self.x = VIRTUAL_WIDTH - 380
	end

--]]

end

function Weiner:render()
	love.graphics.setColor(193/255, 58/255, 0/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, 100, 100)
end