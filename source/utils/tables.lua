function flattenRecursive(e, result)
  -- if e is a table, we should iterate over its elements
  if type(e) == "table" then
    for k,v in pairs(e) do -- for every element in the table
        flattenRecursive(v, result) -- recursively repeat the same procedure
    end
  else -- if not, we can just put it to the result
      table.insert(result, e)
  end
end

function flatten(e)
  local result = {}
  flattenRecursive(e, result)
  return result
end

function map(tbl, f)
  local t = {}
  for k,v in pairs(tbl) do
      t[k] = f(v)
  end
  return t
end