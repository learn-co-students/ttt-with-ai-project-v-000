module Players
  class Computer < Player

    def move(board)

    end

  end

end


When I play TTT 

  def all_routes_player
    Map all free cells to number of routes to victory at that cell position for you.
      For each free cell find win_combinations that include cell
      return selected combinations that do not include opponent
  end

   def all_routes_opponent
    Map all free cells to number of routes to minimum distance from victory at that position for opponent.
      For each free cell find win_combinations that include cell
      return selected combinations that include opponent
  end
  
  def measure_distance_player
    Map all free cells to number of routes to minimum distance from victory at that position for you.
    self.all_routes_player
    Map each combination that includes 2 of my tokens
    Map each combination that includes 1 of my tokens
  end

    def measure_distance_opponent
    Map all free cells to number of routes to minimum distance from victory at that position for opponent.
    self.all_routes_opponent
    Map each combination that includes 2 of opponent tokens
    Map each combination that includes 1 of opponent tokens
  end
  
  
 

  (min distance to victory for you, cell_index) = first cell with minimum distance to victory for you:
    if distance == 1:
      win by placing at cell_index
      return

    (min distance to victory for opponent, cell_index) = first cell with minimum distance to victory for opponent:
      if distance == 1:
        prevent opponent from winning by placing at cell_index
        return
      else:
        optimal_cell = first cell with the maximal number of routes to victory for you
        move to optimal_cell
        return



    I check if opponent is 1 move from winning
    If opponent is 1 move from winning
    I block the remaining index from win_combinations
    If opponent is not 1 move from winning
 

I map all free cells on the board
For each free cell I 
  find win_combinations that include that cell
  and for each combination
  I find combinations that do not include opponents token
  if I find combinations that include two of my tokens
    I move to the remaining free cell
  if I find combinations that include one of my tokens
    I select the first combination
    and include a token to the next free cell from the combination
  if none of the combinationd do not include my token (#first move)
    I select the first available combination that includes 5
    And I move to cell 5
    If a combination that includes 5 is not available
    I select the first available combination
    and move to cell with an even number index




