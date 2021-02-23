TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

local highlighted = 1

function TitleScreenState:update(dt)

--[[
	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()
--]]

	if love.keyboard.wasPressed('up') or love.keyboard.wasPressed('down') then
		highlighted = highlighted == 1 and 2 or 1
		sounds['beep']:play()
	end

	if love.keyboard.wasPressed('h') then
		--sounds['titleMusic']:stop()
		gStateMachine:change('helpState')
	end

	if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
		if highlighted == 1 then
			--sounds['titleMusic']:stop()
			sounds['select']:play()
			gStateMachine:change('playState')
		else
			--sounds['titleMusic']:stop()
			sounds['select']:play()
			love.event.quit()
		end
	end
end


function TitleScreenState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.draw(titleScreen, 0, 0)
	
	--love.graphics.printf('Stephen\'s Sausage Roll', 0, 60, VIRTUAL_WIDTH, 'center')
	--love.graphics.printf('say no  to drugs', 0, 230, VIRTUAL_WIDTH, 'center')
	--love.graphics.printf('would you like drugs?', 0 , VIRTUAL_HEIGHT/ 2 - 10, VIRTUAL_WIDTH, 'center')


	if highlighted == 1 then
		love.graphics.draw(tongs, VIRTUAL_WIDTH / 2 - 154, VIRTUAL_HEIGHT / 2 - 50)
		love.graphics.setColor(80/255, 220/255, 255/255, 255/255)
	end
	love.graphics.setFont(bubbleFont)
	love.graphics.printf('Play', 0, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

	if highlighted == 2 then
		love.graphics.draw(tongs, VIRTUAL_WIDTH / 2 - 154, VIRTUAL_HEIGHT / 2 + 21)
		love.graphics.setColor(80/255, 220/255, 255/255, 255/255)
	end
	love.graphics.setFont(bubbleFont)
	love.graphics.printf('Exit', 0, VIRTUAL_HEIGHT / 2 + 30, VIRTUAL_WIDTH, 'center')
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)

	love.graphics.setFont(tinyBubbleFont)
	love.graphics.printf('Press "H" For Help', 0, VIRTUAL_HEIGHT / 2 + 120, VIRTUAL_WIDTH, 'center')

end