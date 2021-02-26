Level = Class{}

local plateWidth = 100

function Level:init()

end

function Level:update()

end

function Level:render()
--Top Level Stand-In
love.graphics.setColor(192/255, 143/255, 94/255, 255/255)
love.graphics.rectangle('fill', 220, stephen.height + 30, VIRTUAL_WIDTH - 600, 90)

--Ladder Stand-In
--110 wide
love.graphics.setColor(100/255, 20/255, 20/255, 255/255)
love.graphics.rectangle('fill', 220, stephen.height + 30, 110, VIRTUAL_HEIGHT - stephen.height + 30)


--Ground Stand-In
--220 from bottom
love.graphics.setColor(192/255, 143/255, 94/255, 255/255)
love.graphics.rectangle('fill', 0, VIRTUAL_HEIGHT - 90, VIRTUAL_WIDTH, 90)



--Hot Plates Stand-In
--bottom plate
love.graphics.setColor(255/255, 68/255, 0/255, 255/255)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 + plateWidth, VIRTUAL_HEIGHT - 90, plateWidth, 20)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 + (2 * plateWidth), VIRTUAL_HEIGHT - 90, plateWidth, 20)
--top plates
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - (2 * plateWidth), stephen.height + 30, plateWidth, 20)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - plateWidth, stephen.height + 30, plateWidth, 20)

--Top weiner Stand-In
love.graphics.setColor(193/255, 58/255, 0/255, 255/255)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - (3 * plateWidth), stephen.height + 30 - plateWidth, 100, 100)
--Bottom weiner Stand-In
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380 - (2 * plateWidth), VIRTUAL_HEIGHT - 190, 100, 100)

--Empty Trap Stand-In
love.graphics.setColor(0/255, 0/255, 0/255, 255/255)
love.graphics.rectangle('fill', VIRTUAL_WIDTH - 380, VIRTUAL_HEIGHT - 90, 100, 100)
end