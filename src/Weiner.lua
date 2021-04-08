Weiner = Class{}

local fallSpeed = 600

function Weiner:init(x, y, width, height)
	self.width = 100
	self.height = 100
	self.x = x
	self.y = y
	pushedOff = false
	fallen = false
end

function Weiner:collides(weiner)
		if topWeiner.x > bottomWeiner.x + bottomWeiner.width or bottomWeiner.x > topWeiner.x + topWeiner.width then
			return false
		end

		if topWeiner.y > bottomWeiner.y + bottomWeiner.height or bottomWeiner.y > topWeiner.y + topWeiner.height then
			return false
		end

		return true
	end

function Weiner:topReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - 380 - (3 * PLATE_WIDTH)
	self.y = stephen.height + 30 - PLATE_WIDTH
	self.fallen = false
end

function Weiner:bottomReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - 380 - (2* PLATE_WIDTH)
	self.y = VIRTUAL_HEIGHT - 190
	self.fallen = false
end

function Weiner:update(dt)

	--pushes weiners to the right once collided
	if stephen:collides(topWeiner) then
			topWeiner.x = stephen.x + stephen.width
	end

	if stephen:collides(bottomWeiner) then
			bottomWeiner.x = stephen.x + stephen.width
	end

	--clamps falling at floor level
	if topWeiner.pushedOff then
		topWeiner.x = VIRTUAL_WIDTH - 380
		topWeiner.y = math.min(VIRTUAL_HEIGHT - topWeiner.height, topWeiner.y + fallSpeed * dt)
	end

	if bottomWeiner.pushedOff then
		bottomWeiner.x = VIRTUAL_WIDTH - 380
		bottomWeiner.y = math.min(VIRTUAL_HEIGHT - bottomWeiner.height, bottomWeiner.y + fallSpeed * dt)
	end

	--stacks weiners if fallen on top of one another
	if topWeiner:collides(bottomWeiner) then
		topWeiner.y = bottomWeiner.y - 100
	end


	--trigger bottom weiner to fall if first pushed off
	if bottomWeiner.x > VIRTUAL_WIDTH - 380 and not topWeiner.fallen then
		bottomWeiner.pushedOff = true
		bottomWeiner.fallen = true
	end
	--trigger top weiner to fall if first pushed off
	if topWeiner.x > VIRTUAL_WIDTH - 380 and not topWeiner.fallen then
		topWeiner.pushedOff = true
		topWeiner.fallen = true
	end
end

function Weiner:render()
	love.graphics.setColor(193/255, 58/255, 0/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end