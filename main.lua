local g3d = require "g3d"
local skybox = g3d.newModel("content/models/sphere.obj", "content/sky/plainsky.png", nil, nil, 500)
local timer = 0
local shadows = love.graphics.newShader("g3d/g3d.vert", "content/shader/lighting.frag")
local maxwell = g3d.newModel("content/models/dingus.obj", "content/textures/dingus.jpg", {10,5,6}, nil, {1,1,1})
local maxwellwhiskers = g3d.newModel("content/models/whiskers.obj", "content/textures/dingus-whiskers.png", {10,5,6}, nil, {1,1,1})
eras = love.graphics.newFont("content/fonts/erasdemi.ttf", 30)
dingustheme = love.sound.newSoundData("content/music/maxwell.mp3")
song = love.audio.newSource(dingustheme, static)
song:setLooping(true)
song:play()

function love.update(dt)
    timer = timer + dt
maxwell:setRotation(0, 0, math.pi - timer)
maxwellwhiskers:setRotation(0, 0, math.pi - timer)
    g3d.camera.firstPersonMovement(dt)
    if love.keyboard.isDown "escape" then
        love.event.push "quit"    
song:stop()
end
end

function love.draw()
   g3d.camera.updateViewMatrix(shadows)
    g3d.camera.updateProjectionMatrix(shadows)
    skybox:draw()
    maxwell:draw()
    maxwellwhiskers:draw()
  love.graphics.setFont(eras)
love.graphics.print("ALPHA v0.0.2", 10, 10) 
love.graphics.print("FPS: "..tostring(love.timer.getFPS( )), 10, 40)	
   love.graphics.print("Time: "..tostring(love.timer.getTime( )), 10, 70)
end

 function love.mousemoved(x,y, dx,dy)
    g3d.camera.firstPersonLook(dx,dy)
 end
