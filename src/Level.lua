Level = Class{}

function Level:init()

end

function Level:update()
	if topWeiner.y == VIRTUAL_HEIGHT - FLOOR_HEIGHT and bottomWeiner.y == VIRTUAL_WIDTH - WEINER_GIRTH then
		stephen.winState = true
	end

end

function Level:render()
--Top Level Stand-In
--Right most level x == VIRTUAL_WIDTH - 380 
love.graphics.setColor(192/255, 143/255, 94/255, 255/255)
love.graphics.rectangle('fill', LADDERX, TOP_FLOORY, VIRTUAL_WIDTH - LADDERX - (PLATE_WIDTH * 4), FLOOR_HEIGHT)

--Ladder Stand-In
--110 wide
love.graphics.setColor(100/255, 20/255, 20/255, 255/255)
love.graphics.rectangle('fill', LADDERX, TOP_FLOORY, LADDER_WIDTH, VIRTUAL_HEIGHT - (TOP_FLOORY) - FLOOR_HEIGHT)


--Ground Stand-In
--220 from bottom
love.graphics.setColor(192/255, 143/255, 94/255, 255/255)
love.graphics.rectangle('fill', 0, VIRTUAL_HEIGHT - FLOOR_HEIGHT, VIRTUAL_WIDTH, FLOOR_HEIGHT)



--Hot Plates Stand-In
--bottom plate
love.graphics.setColor(255/255, 68/255, 0/255, 255/255)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - (PLATE_WIDTH * 3), VIRTUAL_HEIGHT - FLOOR_HEIGHT, PLATE_WIDTH, PLATE_HEIGHT)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - (PLATE_WIDTH * 2), VIRTUAL_HEIGHT - FLOOR_HEIGHT, PLATE_WIDTH, PLATE_HEIGHT)
--top plates
love.graphics.rectangle('fill', VIRTUAL_WIDTH - (PLATE_WIDTH * 6), TOP_FLOORY, PLATE_WIDTH, PLATE_HEIGHT)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - (PLATE_WIDTH * 5), TOP_FLOORY, PLATE_WIDTH, PLATE_HEIGHT)

--Top weiner Stand-In
--love.graphics.setColor(193/255, 58/255, 0/255, 255/255)
--love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - (3 * PLATE_WIDTH), stephen.height + 30 - PLATE_WIDTH, 100, 100)
--Bottom weiner Stand-In
--love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - (2 * PLATE_WIDTH), VIRTUAL_HEIGHT - 190, 100, 100)

--Empty Trap Stand-In
love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - (PLATE_WIDTH * 4), VIRTUAL_HEIGHT - FLOOR_HEIGHT, PLATE_WIDTH, PLATE_WIDTH)

--Halo
end