Weiner = Class{}

local fallSpeed = 600
local increment = 60

function Weiner:init(x, y, width, height)
	self.width = WEINER_GIRTH
	self.height = WEINER_GIRTH
	self.x = x
	self.y = y
	self.pushedOff = false
	self.fallen = false
	self.burnt = false
end

function Weiner:collides(weiner)
		if topWeiner.x >= bottomWeiner.x + bottomWeiner.width or bottomWeiner.x >= topWeiner.x + topWeiner.width then
			return false
		end

		if topWeiner.y >= bottomWeiner.y + bottomWeiner.height or bottomWeiner.y >= topWeiner.y + topWeiner.height then
			return false
		end

		return true
	end

function Weiner:topReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 7)
	self.y = TOP_FLOORY - WEINER_GIRTH
	self.fallen = false
	self.burnt = false
end

function Weiner:bottomReset()
	self.pushedOff = false
	self.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 6)
	self.y = VIRTUAL_HEIGHT - FLOOR_HEIGHT - WEINER_GIRTH
	self.fallen = false
end


function Weiner:update(dt)

	--pushes weiners to the right once collided
	if stephen:collides(topWeiner) then
		topWeiner.x = math.min(VIRTUAL_WIDTH - WEINER_GIRTH, stephen.x + stephen.width)
	end

	if stephen:collides(bottomWeiner) then
		bottomWeiner.x = math.min(VIRTUAL_WIDTH - WEINER_GIRTH, stephen.x + stephen.width)
	end

	--stacks weiners if fallen on top of one another
	if topWeiner:collides(bottomWeiner) then
		stackedOffset = topWeiner.x - bottomWeiner.x 
		topWeiner.pushedOff = false
		topWeiner.fallen = false
		topWeiner.y = bottomWeiner.y - WEINER_GIRTH
	end

	--clamps falling at floor level
	if topWeiner.pushedOff then
		topWeiner.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 4)
		topWeiner.y = math.min(VIRTUAL_HEIGHT - WEINER_GIRTH, topWeiner.y + fallSpeed * dt)
	end

	--trigger bottom weiner to fall if first pushed off
	if bottomWeiner.x > VIRTUAL_WIDTH - (PLATE_WIDTH * 4) and not topWeiner.fallen then
		bottomWeiner.pushedOff = true
		bottomWeiner.fallen = true
	end

	if bottomWeiner.pushedOff then
		bottomWeiner.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 4)
		bottomWeiner.y = math.min(VIRTUAL_HEIGHT - WEINER_GIRTH, bottomWeiner.y + fallSpeed * dt)
	end


	--trigger top weiner to fall if first pushed off
	if topWeiner.x > VIRTUAL_WIDTH - (PLATE_WIDTH * 4) and not topWeiner.fallen then
		topWeiner.pushedOff = true
		topWeiner.fallen = true
	end

	if topWeiner.x > VIRTUAL_WIDTH - (PLATE_WIDTH * 3) then
		topWeiner.burnt = true
	end

	--flushes pushedOff so topweiner x is free to move again
	if topWeiner.y == VIRTUAL_HEIGHT - WEINER_GIRTH * 2 and bottomWeiner.fallen then
		topWeiner.pushedOff = false
	end


end

function Weiner:render()
	love.graphics.setColor(54/255, 138/255, 50/255, 255/255)
	love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

	if topWeiner.burnt then
		topWeiner.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 3)
		stephen.x = VIRTUAL_WIDTH - (PLATE_WIDTH * 3) - stephen.width
		love.graphics.setFont(comicFont)
		love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
		love.graphics.printf('BURNED', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH / 2, 'center')
	end
	--Debug
	love.graphics.setFont(tinyBubbleFont)
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.print('Collision = ' .. tostring(stephen:collides(topWeiner)), 0, increment)
	love.graphics.print('topWeiner.fallen: ' .. tostring(topWeiner.fallen), 0, increment * 2)
	love.graphics.print('stackedOffset = ' .. tostring(stackedOffset), 0, increment * 3)
	love.graphics.print('topWeiner.y = ' .. tostring(topWeiner.y), 0, increment * 4)
	love.graphics.print('topWeiner.pushedOff = ' .. tostring(topWeiner.pushedOff), 0, increment * 5)
end