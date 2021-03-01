require 'src/dependencies'

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('SSR')

	love.mouse.setVisible(false)

	titleScreen = love.graphics.newImage('/pictures/SSR_title.png')
	tongs = love.graphics.newImage('/pictures/SSR_tongs.png')

	bubbleFont = love.graphics.newFont('fonts/thebubbleletters.ttf', 40)
	tinyBubbleFont = love.graphics.newFont('fonts/thebubbleletters.ttf', 24)
	comicFont = love.graphics.newFont('fonts/amateurcomic.ttf', 40)
	love.graphics.setFont(bubbleFont)

	sounds = {
		['beep'] = love.audio.newSource('music/beep.wav', 'static'),
		['select'] = love.audio.newSource('music/select.wav', 'static')
	}

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = false
	})

	gStateMachine = StateMachine {
		['titleState'] = function() return TitleScreenState() end,
		['playState'] = function() return PlayState() end,
		['tripState'] = function() return TripState() end,
		['helpState'] = function() return HelpState() end
	}

	gStateMachine:change('titleState')

	stephen = Stephen(0, VIRTUAL_HEIGHT - 220, 200, 130)

	bottomWeiner = Weiner(VIRTUAL_WIDTH - 380 - (2* PLATE_WIDTH), VIRTUAL_HEIGHT - 190, 100, 100)

	topWeiner  = Weiner(VIRTUAL_WIDTH - 380 - (3 * PLATE_WIDTH), stephen.height + 30 - PLATE_WIDTH, 100, 100)

	levelOutline = Level()

	love.keyboard.keysPressed = {}


end

function love.resize(w, h)
	push:resize(w,h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true

	if key == 'escape' then
		love.event.quit()
	end

	if key == "tab" then
			local state = not love.mouse.isVisible()
			love.mouse.setVisible(state)
		end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end


function love.update(dt)

	gStateMachine:update(dt)

	love.keyboard.keysPressed = {} 
end

function love.draw()
	push:start()

	gStateMachine:render()

	displayFPS()

	push:finish()
end

function displayFPS()
	love.graphics.setFont(bubbleFont)
	love.graphics.setColor(0/255, 255/255, 0/255, 255/255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end