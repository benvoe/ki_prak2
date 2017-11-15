require('Praktikum_2/eight_queens')

function backtracking( _queens, _elements, _counter )
  counter = _counter or 0
  local queens = _queens or {}
  local elements = _elements or {  [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true }
  local remaining = { unpack( elements ) }
  local d = #queens + 1
  
  if #queens == 8 then
    local test_queen = eight_queens:new( queens )
    if test_queen:fitness() == 28 then
      counter = counter + 1
      print(counter .. '. Loesung:')
      test_queen:Print()
    end
  end
  
  for i, v in ipairs( queens ) do
    if remaining[ v + (d-i) ] then remaining[ v + (d-i) ] = false end
    if remaining[ v - (d-i) ] then remaining[ v - (d-i) ] = false end
  end
  
  for i, v in ipairs( remaining ) do
    if v then
      elements[i] = false
      table.insert( queens, i)
      
      backtracking( queens, elements, counter )
      
      table.remove( queens, #queens )
      elements[i] = true
    end
  end
end

