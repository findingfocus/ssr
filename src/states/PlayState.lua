PlayState = Class{__includes = BaseState}

function PlayState:init()

end

function PlayState:update(dt)
	if love.keyboard.wasPressed('h') then
		gStateMachine:change('helpState')
	end

	if love.keyboard.wasPressed('r') then
		stephen:reset()
		topWeiner:reset()
		bottomWeiner:reset()
	end

	bottomWeiner:update(dt)
	topWeiner:update(dt)
	stephen:update(dt)


end


function PlayState:render()
	love.graphics.clear(100/255, 110/255, 200/255, 255/255)
	levelOutline:render()
	stephen:render()
	topWeiner:render()
	bottomWeiner:render()
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
end 

