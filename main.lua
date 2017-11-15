
--[[
require "turtle"

local x, y = 450, 450

  dofile('Praktikum_2/chess.lua')
  size(x,y)
  --]]
  
  
  require('Praktikum_2/eight_queens')
  require('Praktikum_2/GA')
  require('Praktikum_2/backtracking')
  math.randomseed( os.time() )
  
  --[[ PROBLEM 4: Genetische Algorithmen
    solution = genetic_algorithm(6)
    solution:Print()
  --]]
  
  --[[ PROBLEM 5: Backtracking Search
    backtracking()
  --]]