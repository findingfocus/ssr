PlayState = Class{__includes = BaseState}

function PlayState:init()

end

function PlayState:update(dt)
	if love.keyboard.wasPressed('h') then
		gStateMachine:change('helpState')
	end

	if love.keyboard.wasPressed('r') then
		--sounds['playMusic']:stop()
		gStateMachine:change('titleState')
	end

	stephen:update(dt)


end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setColor(255/255, 70/255, 70/255, 255/255)
	stephen:render()
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
end 

