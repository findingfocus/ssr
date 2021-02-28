Weiner = Class{}



function Weiner:init(x, y, width, height)
	self.width = 100
	self.height = 100
	self.x = x
	self.y = y
end

function Weiner:update(dt)
	--if colliding
	if stephen.x > self.x then
		self.x = stephen.x
	end
end

function Weiner:render()
	love.graphics.setColor(193/255, 58/255, 0/255, 255/255)
	love.graphics.rectangle('fill', self.x + stephen.width, self.y, 100, 100)
end