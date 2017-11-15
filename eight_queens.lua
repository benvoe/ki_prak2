require("Class")
 
eight_queens = {}

------------------------------------------------------------------------

function eight_queens:Print()
  hr = "+ - + - + - + - + - + - + - + - +"
  blank = "   "
  queen = " Q "
  print(hr)
  
  for i = 1, 8 do 
    line = "|"
    for j = 1, 8 do
      if self.queens[j] == i then
        line = line .. queen .. "|"
      else  
        line = line .. blank .. "|"
      end
    end
    print(line)
    print(hr)
  end
  print("\n")
end

------------------------------------------------------------------------

function eight_queens:PrintH()
  hr = "+ - + - + - + - + - + - + - + - +"
  blank = "   "
  queen = " Q "
  print(hr)
  
  for l = 1, 8 do 
    line = "|"
    for q = 1, 8 do
      if self.queens[q] == l then
        line = line .. queen .. "|"
      else  
        heu = self:h_ges(q, l)
        if heu < 10 then heu = heu .." " end
        line = line .. heu .. " |"
      end
    end
    print(line)
    print(hr)
  end
  print("\n")
end

------------------------------------------------------------------------

function eight_queens:move( queen, position )
  if queen > 8 or queen < 1 or position > 8 or position < 1 then return end
  self.queens[queen] = position;
end

------------------------------------------------------------------------

function eight_queens:h( queen, position )
  pos = position or self.queens[queen]
  dist = queen - 1
  iter = -1
  collisions = 0
  
  for i = 1, 8 do
    comp = self.queens[i]
    
    if dist == 0 then 
      iter = 1 
    elseif comp == pos or comp == pos - dist or comp == pos + dist then
      collisions = collisions + 1
    end
    dist = dist + iter
  end
  
  return collisions
end

------------------------------------------------------------------------

function eight_queens:h_ges( queen, position )
  if not queen and position or queen and not position then return end
  
  result = 0
  
  if queen then
    queen_orig = self.queens[queen]
    self.queens[queen] = position
  end

  for i = 1, 8 do
    result = result + self:h(i)
  end
  
  if queen then
    self.queens[queen] = queen_orig
  end
  
  return result / 2
end

------------------------------------------------------------------------

function eight_queens:fitness()
  return 28 - self:h_ges()
end

------------------------------------------------------------------------

function eight_queens:iterate()
    self.queens[1] = self.queens[1] + 1
   for i = 1, #self.queens do
      if self.queens[i] > 8 then
        if i == #self.queens then 
          return false 
        else
          self.queens[i] = 1
          self.queens[i+1] = self.queens[i+1] + 1
          self:Print()
        end
      end
    end
    return true
end

------------------------------------------------------------------------

local eight_queens_mt = Class(eight_queens)

------------------------------------------------------------------------

function eight_queens:new( initializor )
  local queens
  if type(initializor) == "table" and #initializor == 8 then
    queens = initializor
  elseif initializor == "genes" then
    queens = random_queens()
  else
    queens = {5, 6, 7, 4, 5, 6, 7, 6}
  end
  return setmetatable( {queens = queens}, eight_queens_mt )
end

------------------------------------------------------------------------

function random_queens ()
  result = {}
  for i = 1, 8 do
    table.insert(result, math.random(8))
  end
  return result
end

------------------------------------------------------------------------


