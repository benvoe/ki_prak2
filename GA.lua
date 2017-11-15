require('Praktikum_2/eight_queens')

function genetic_algorithm( _population_size )
  population_size = _population_size or 4
  
  if population_size % 2 == 1 then 
    population_size = population_size + 1 
  end
  
  found_solution = false
  counter = 0
  population = {}
  
  for i = 1, population_size do
    table.insert(population, eight_queens:new("genes"))
  end
  
  table.sort( population, sort_genes )
    
  while not found_solution do
    
    --[[ AUSGABEN aller
    for i = 1, population_size do
      print("Fitness von Individuum" .. i .. " ist: " .. population[i]:fitness())
    end
      print("\n")
    --]]
    
    new_population = {}
    
    for i = 1, population_size / 2 do
      for _,k in ipairs( { crossover( selection( population, population_size ) ) } ) do
        table.insert(new_population, k)
      end
    end
    
    population = new_population
    
    table.sort( population, sort_genes )
    
    counter = counter + 1
    
    if population[1]:fitness() == 28 then
      print('A solution was found in Iteration ' .. counter .. '.')
      return population[1]
    else
      print('Best in Iteration ' .. counter .. ' with fitness of ' .. population[1]:fitness() .. ':')
      population[1]:Print()
    end
  end
end

------------------------------------------------------------------------

function sort_genes( a, b )
  return a:fitness() > b:fitness()
end

------------------------------------------------------------------------

function selection( population )
  perc = {}
  local ges = 0
  local min = 18
  
  
  -- Generate likelyhood for Individuals
  for i = 1, #population do
    local f = population[i]:fitness()
    f = math.pow(f,10)
    ges = ges + f
    table.insert( perc, f )
  end
  
  for i = 1, #population do
    perc[i] = perc[i] / ges
    
    if i > 1 then
      perc[i] = perc[i] + perc[i-1]
    end
  end
  
  -- Select first Individual for pairing
  rand = math.random()
  
  for a = 1, #population do
    if rand < perc[a] then 
      _a = a
      break
    end
  end
  
  -- Select second Individual for pairing
  rand = math.random()
  b = 1
  
  while b <= #population do
    if rand < perc[b] then 
      if b == _a or population[b]:fitness() < min then 
        b = 1
        rand = math.random()
        sum = 0
      else
        return population[_a], population[b]
      end      
    end
    b = b + 1
  end
end

------------------------------------------------------------------------

function crossover( a, b )
  local child1, child2 = {}, {}
  first = true
  p_mutation = 0.25
  crossover_point = math.random( 8 )
  
  -- Crossing two Individuals
  for i = 1, 8 do
    if i == crossover_point then 
      first = not first
    end
    if first then
      table.insert( child1, a.queens[i] )
      table.insert( child2, b.queens[i] )
    else
      table.insert( child1, b.queens[i] )
      table.insert( child2, a.queens[i] )
    end
  end
  
  -- Mutation
  if math.random() < p_mutation then
    child1[math.random(8)] = math.random(8)
  end
  if math.random() < p_mutation then
    child2[math.random(8)] = math.random(8)
  end
 
  return eight_queens:new(child1), eight_queens:new(child2)
end

------------------------------------------------------------------------