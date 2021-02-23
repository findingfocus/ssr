PlayState = Class{__includes = BaseState}

function PlayState:init()

end

playerX = 0
local GRAVITY = 20
PLAYER_SPEED = 350
playerY = 720 - 130
grounded = true
local ladderArea = false


function PlayState:update(dt)
	--sounds['playMusic']:setLooping(true)
	--sounds['playMusic']:play()

	-- check to see if on ladder
	--if playerY < 720 - 130 or playerY > 50 then
	--	onLadder = true
	--else
	--	onLadder = false

	if playerX > 230 and playerX < 270 then
		ladderArea = true
	end

	if playerX < 230 or playerX > 270 then
		ladderArea = false
	end

	
	if love.keyboard.isDown('right') and grounded then
		playerX = math.min(VIRTUAL_WIDTH - 200, playerX + PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('left') and grounded then
		playerX = math.max(0, playerX - PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('up') and ladderArea then
		playerY = math.max(playerY - 10, 50)
		grounded = false
		if playerY == 50 then
			grounded = true
		end
	end

	if love.keyboard.isDown('down') and ladderArea then
		playerY = math.min(playerY + 10, 720 - 130)
		grounded = false
		if playerY == 590 then
			grounded = true
		end
	end


	if love.keyboard.wasPressed('h') then
		gStateMachine:change('helpState')
	end



	--cloudScroll = (cloudScroll + CLOUD_SCROLL_SPEED * dt)
	--	% CLOUD_LOOPING_POINT

	if love.keyboard.wasPressed('r') then
		--sounds['playMusic']:stop()
		gStateMachine:change('titleState')
		playerX = 0
		playerY = 720 - 130
		playerDY = 0
	end

	playerY = math.min(VIRTUAL_HEIGHT - 200, playerY)

end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setColor(255/255, 70/255, 70/255, 255/255)
	love.graphics.rectangle('fill', playerX, playerY, 200, 130)

	love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	--love.graphics.draw(clouds, -cloudScroll, 0)

	--love.graphics.setColor(255/255, 255/255, 255/255, 255/255)
	--love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end 

