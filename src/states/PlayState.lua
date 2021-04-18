PlayState = Class{__includes = BaseState}

local increment = 60

function PlayState:init()

end

function PlayState:update(dt)
	if love.keyboard.wasPressed('h') then
		gStateMachine:change('helpState')
	end

	if love.keyboard.wasPressed('r') then
		stephen:reset()
		topWeiner:topReset()
		bottomWeiner:bottomReset()
		stephen.winState = false
	end

	bottomWeiner:update(dt)
	topWeiner:update(dt)
	stephen:update(dt)


end


function PlayState:render()
	love.graphics.clear(130/255, 140/255, 230/255, 255/255)
	levelOutline:render()
	topWeiner:render()
	bottomWeiner:render()

	--Debug
	love.graphics.setFont(tinyBubbleFont)
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.print('topWeiner.y: ' .. tostring(topWeiner.y), 0, increment)
	love.graphics.print('bottomWeiner.x: ' ..tostring(bottomWeiner.x), 0, increment * 2)

	if stephen.winState then
		love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
		love.graphics.draw(halo, 0, GROUND_FLOOR_STEPHENY + 18)
	end

	if stephen.winState and stephen.x == 0 then
		love.graphics.setFont(comicFont)
		love.graphics.printf('SUCCESS', VIRTUAL_WIDTH / 2, VIRTUAL_HEIGHT / 2, VIRTUAL_WIDTH / 2, 'center')
	end

	stephen:render()
end 

