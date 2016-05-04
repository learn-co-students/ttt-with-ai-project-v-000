require 'pry'

class Computer < Player
  
  def move(board)
    @board = board
    #binding.pry
    
    
    if board.turn_count == 0
      first_move.to_s
    elsif board.turn_count == 1
      second_move.to_s
    elsif board.turn_count == 2
      third_move.to_s
    elsif board.turn_count == 3
      fourth_move.to_s
    elsif board.turn_count.between?(4,8)
      rest_of_moves.to_s
    end
      
  end







  
  def first_move
    @my_first_x = 5
  end
  
  def second_move
    @opp_first_x = @board.cells.find_index { |cell| cell == "X" } + 1
    
    if @opp_first_x == 5
      @my_first_o = [1, 3, 7, 9].sample
    else
      @my_first_o = 5
    end
  end
  
  def third_move
    @opp_first_o = @board.cells.find_index { |cell| cell == "O" } + 1
    
    if @opp_first_o.even?
      edge_response = {2 => [7, 9], 4 => [3, 9], 6 => [1, 7], 8 => [1, 3]}
      @my_second_x = edge_response[@opp_first_o].sample
    else
      corner_response = {1 => 9, 9 => 1, 3 => 7, 7 => 3}
      @my_second_x = corner_response[@opp_first_o]
    end    
  end
  
  def fourth_move
    xs = []
    @board.cells.each_with_index do |cell, cell_index|
      xs << (cell_index + 1) if cell == "X"
    end
    
    @opp_first_x, @opp_second_x = xs
    opposite_corner = {1 => 9, 9 => 1, 3 => 7, 7 => 3}
    opposite_x = opposite_corner[@my_first_o]
    
    if xs.include?(5) && xs.include?(opposite_x)
      @my_second_o = [1,3,7,9].reject! do |corner|
        corner == @my_first_o || corner == opposite_x
      end.sample
    else
      winning_positions.each do |winning_combo|
        if (xs - winning_combo).empty?
          @my_second_o = (winning_combo - xs).first
        else
          rand(1..9)
        end
      end
    end
  end
  
  def rest_of_moves
    #binding.pry
    xs = []
    @board.cells.each_with_index do |cell, cell_index|
      xs << (cell_index + 1) if cell == "X"
    end
    
    os = []
    @board.cells.each_with_index do |cell, cell_index|
      os << (cell_index + 1) if cell == "O"
    end
    
    winning_positions.each do |winning_combo|
      if (xs - winning_combo).empty?
        if @board.valid_move?((winning_combo - xs).first)  
          @my_third_x = (winning_combo - xs).first
          break
        end
      elsif (os - winning_combo).empty?
        if @board.valid_move?((winning_combo - os).first)  
          @my_third_x = (winning_combo - os).first
          break
        end
      else
        @my_third_x = rand(1..9)
      end
    end
  end
  
  
  
  def winning_positions
    #binding.pry
    winning_cell_combos = []
    
    Game::WIN_COMBINATIONS.each do |winning_combo|
      winning_cell_combo = []
      
      winning_combo.each do |index|
        winning_cell_combo << index + 1
      end
      winning_cell_combos << winning_cell_combo
    end
    
    winning_cell_combos
  end
  
end