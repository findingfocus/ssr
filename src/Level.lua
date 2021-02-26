Level = Class{}

function Level:init()

end

function Level:update()

end

function Level:render()
--Ladder Stand-In
--110 wide

--Ground Stand-In
--220 from bottom
love.graphics.setColor(192/255, 143/255, 94/255, 255/255)
love.graphics.rectangle('fill', 0, VIRTUAL_HEIGHT - 90, VIRTUAL_WIDTH, 90)

--Top Level Stand-In

love.graphics.rectangle('fill', 220, stephen.height + 30, VIRTUAL_WIDTH - 600, 90)


--Hot Plates Stand-In

end