class ('SceneManager').extends()

function SceneManager:switchScene(scene, ...)
  self.newScene = scene
  self.sceneArgs = ...

  self:loadNewScene()
end

function SceneManager:loadNewScene()
  self:cleanupScene()
  self.newScene(self.sceneArgs)
end

function SceneManager:cleanupScene()
  playdate.graphics.sprite.removeAll()
  self:removeAllTimers()
  playdate.graphics.setDrawOffset(0, 0)
end

function SceneManager:removeAllTimers()
  local alltimers = playdate.timer.allTimers()
  for _, timer in ipairs(alltimers) do
    timer:remove()
  end
end