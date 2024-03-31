class ('SceneManager').extends()

function SceneManager:init()
  self.transitionTime = 1000
  self.transitioning = false
end

function SceneManager:switchScene(scene, ...)
  if self.transitioning then
      return
  end

  self.transitioning = true
  self.newScene = scene
  self.sceneArgs = {...}

  self:startTransition()
end

function SceneManager:loadNewScene()
  self:cleanupScene()
  self.newScene(table.unpack(self.sceneArgs))
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

function SceneManager:startTransition()
  local transitionTimer = self:wipeTransition(0, 400)

  transitionTimer.timerEndedCallback = function()
      self:loadNewScene()
      transitionTimer = self:wipeTransition(400, 0)
      transitionTimer.timerEndedCallback = function()
          self.transitioning = false
          self.transitionSprite:remove()
          -- Temp fix to resolve bug with sprite artifacts/smearing after transition
          local allSprites =  playdate.graphics.sprite.getAllSprites()
          for i=1,#allSprites do
              allSprites[i]:markDirty()
          end
      end
  end
end

function SceneManager:createTransitionSprite()
  local filledRect = playdate.graphics.image.new(400, 240, playdate.graphics.kColorBlack)
  local transitionSprite = playdate.graphics.sprite.new(filledRect)
  transitionSprite:moveTo(200, 120)
  transitionSprite:setZIndex(10000)
  transitionSprite:setIgnoresDrawOffset(true)
  transitionSprite:add()
  self.transitionSprite = transitionSprite
  return transitionSprite
end

function SceneManager:wipeTransition(startValue, endValue)
  local transitionSprite = self:createTransitionSprite()
  transitionSprite:setClipRect(0, 0, startValue, 240)

  local transitionTimer = playdate.timer.new(self.transitionTime, startValue, endValue, playdate.easingFunctions.inOutCubic)
  transitionTimer.updateCallback = function(timer)
      transitionSprite:setClipRect(0, 0, timer.value, 240)
  end
  return transitionTimer
end
