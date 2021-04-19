require 'src/dependencies'

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('SSR')

	love.mouse.setVisible(false)

	titleScreen = love.graphics.newImage('/pictures/SSR_titleEmpty.png')
	tongs = love.graphics.newImage('/pictures/SSR_tongs.png')
	halo = love.graphics.newImage('/pictures/SSR_Halo.png')
	jalapeno = love.graphics.newImage('/pictures/jalapeno.png')
	jalapenoCooked1 = love.graphics.newImage('/pictures/jalapenoCooked1.png')
	jalapenoCooked2 = love.graphics.newImage('/pictures/jalapenoCooked2.png')
	jalapenoBurnt = love.graphics.newImage('/pictures/jalapenoBurnt.png')
	n = love.graphics.newImage('/pictures/n.png')
	particle = love.graphics.newImage('/pictures/particle.png')

	bubbleFont = love.graphics.newFont('fonts/thebubbleletters.ttf', 40)
	tinyBubbleFont = love.graphics.newFont('fonts/thebubbleletters.ttf', 24)
	comicFont = love.graphics.newFont('fonts/amateurcomic.ttf', 40)
	titleFont = love.graphics.newFont('fonts/amateurcomic.ttf', 80)
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
		['helpState'] = function() return HelpState() end
	}

	gStateMachine:change('titleState')

	stephen = Stephen(0, GROUND_FLOOR_STEPHENY, 200, 130)

	bottomWeiner = Weiner(VIRTUAL_WIDTH - (PLATE_WIDTH * 6), VIRTUAL_HEIGHT - FLOOR_HEIGHT - WEINER_GIRTH, WEINER_GIRTH, WEINER_GIRTH, 2)
	
	topWeiner  = Weiner(VIRTUAL_WIDTH - (PLATE_WIDTH * 7), TOP_FLOORY - WEINER_GIRTH, WEINER_GIRTH, WEINER_GIRTH, 1)
	--Weiner(VIRTUAL_WIDTH - 380 - (3 * PLATE_WIDTH), stephen.height + 30 - PLATE_WIDTH, 100, 100)

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
	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end