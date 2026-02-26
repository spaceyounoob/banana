local g3d = require "g3d"
local skybox = g3d.newModel("content/models/sphere.obj", "content/sky/plainsky.png", nil, nil, 500)
local timer = 0
local shader = love.graphics.newShader("g3d/g3d.vert", "content/shader/lighting.frag")
local maxwell = g3d.newModel("content/models/dingus.obj", "content/textures/dingus.jpg", {10,5,6}, nil, {1,1,1})
local maxwellwhiskers = g3d.newModel("content/models/whiskers.obj", "content/textures/dingus-whiskers.png", {10,5,6}, nil, {1,1,1})
eras = love.graphics.newFont("content/fonts/erasdemi.ttf", 30)

function love.update(dt)
    timer = timer + dt
    g3d.camera.firstPersonMovement(dt)
    if love.keyboard.isDown "escape" then
        love.event.push "quit"
    end
end

function love.draw()
    skybox:draw()
    maxwell:draw()
    maxwellwhiskers:draw()
  love.graphics.setFont(eras)
love.graphics.print("ALPHA v0.0.1", 10, 10) 
love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 40)	
   love.graphics.print("Time: "..tostring(love.timer.getTime( )), 10, 70)
end

function love.mousemoved(x,y, dx,dy)
    g3d.camera.firstPersonLook(dx,dy)
end
