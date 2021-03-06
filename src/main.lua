-- Plugins
debugger = require('lib/debugger')

-- Managers
spriteManager = require('lib/managers/spriteManager')
audioManager = require('lib/managers/audioManager')
fontManager = require('lib/managers/fontManager')
overlayManager = require('lib/managers/overlayManager')
screenManager = require('lib/managers/screenManager')

-- Initialize debugger math helper
debugger.fpsMath()

----------------------------------------
-- Love2D Initialization
----------------------------------------
function love.load()
  -- Initialize assets
  spriteManager.Load()
  audioManager.Load()
  fontManager.Load()
  overlayManager.Load()
  screenManager.Load()

  -- Initialize debug graph
  debugger.Load()

  -- Scroll wheel
  scrollWheelX = 0
  scrollWheelY = 0
end

----------------------------------------
-- Love2D Key press check
----------------------------------------
function love.keypressed(key)
  -- Debugger graph toggle
  debugger.keypressed(key, "f12")

  -- Overlay manage key press checks
  overlayManager.KeyPressed(key)

  -- Screen manager key press checks
  screenManager.KeyPressed(key)
end

----------------------------------------
-- Love2D Mouse press check
----------------------------------------
function love.mousepressed(x, y, button)
  -- Overlay manager mouse action checks
  overlayManager.MousePressed(x, y, button) 

  -- Level manager mouse action checks
  levelManager.MousePressed(x, y, button) 

  -- Screen manager key press checks
  screenManager.MousePressed(x, y, button)
end

----------------------------------------
-- Love2D Update
----------------------------------------
function love.update(dt)
  -- Screen manager update
  screenManager.Update(dt)

  -- Debug graph update
  debugger.Update(dt)
end

----------------------------------------
-- Love2D Draw
----------------------------------------
function love.draw()
  -- Screen manager draw
  screenManager.Draw()

  -- Draw Debug Graph
  -- MUST be last to make top layer
  debugger.Draw()
end