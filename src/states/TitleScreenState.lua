TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

local highlighted = 1
local rotation = 0

function TitleScreenState:update(dt)

--[[
	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()
--]]
rotation = rotation + dt

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

	love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
	love.graphics.setFont(titleFont)
	love.graphics.printf('Paulapeno\'s', 0, 200, VIRTUAL_WIDTH, 'center')
	love.graphics.draw(n, VIRTUAL_WIDTH - 545, VIRTUAL_HEIGHT - 525)

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

	love.graphics.draw(jalapeno, VIRTUAL_WIDTH / 2 - 320, VIRTUAL_HEIGHT / 2 - 120, rotation, 1, 1, WEINER_GIRTH / 2, WEINER_GIRTH / 2)
	love.graphics.draw(jalapeno, VIRTUAL_WIDTH / 2 + 320, VIRTUAL_HEIGHT / 2 - 120, rotation, -1, -1, WEINER_GIRTH / 2, WEINER_GIRTH / 2)

end