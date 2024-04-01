class("TurnManager").extends()

function TurnManager:init()
  self.interval = 150
  self.entities = {}
  self.lastCall = playdate.getCurrentTimeMilliseconds()
end

function TurnManager:addEntitiy(entity)
  table.insert(self.entities, entity)
end

function TurnManager:removeEntity(entity)
  table.remove(self.entities, entity)
end

function TurnManager:refresh()
  for i, e in ipairs(self.entities) do
    e:refresh()
  end
end

function TurnManager:turn()
  local now = playdate.getCurrentTimeMilliseconds()
  local limit = self.lastCall + self.interval

  if now > limit then
    for i, e in ipairs(self.entities) do
      if not e:over() then
        e:turn()
        break
      end
    end
    self.lastCall = nil
    self.lastCall = now
  end
end

function TurnManager:over()
  for i, e in ipairs(self.entities) do
    if e:over() then
      return true
    end
  end
  return false
end
