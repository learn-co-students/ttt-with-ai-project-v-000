require 'pry'

class Computer < Player
  
  WINNING_ROWS = [
    [1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[7,5,3]
  ]
  
   
  
  def move(board)
    @board = board

    
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
    @board.move_history.each_with_index { |move, i| xs << (move + 1) if i.even? }
    
    @opp_first_x, @opp_second_x = xs
    opposite_corner = {1 => 9, 9 => 1, 3 => 7, 7 => 3}
    opposite_x = opposite_corner[@my_first_o]
    
    if xs.include?(5) && xs.include?(opposite_x)
      @my_second_o = [1,3,7,9].reject! do |corner|
        corner == @my_first_o || corner == opposite_x
      end.sample
    elsif two_of_three("X") && @board.valid_move?(two_of_three("X"))
      @my_second_o = two_of_three("X")
    else
      @board.cells.each_with_index { |cell, i| @my_second_o = (i + 1) if cell.empty? }
      @my_second_o
    end
  end  
  
  def rest_of_moves
    # binding.pry
    if two_of_three(@token) && @board.valid_move?(two_of_three(@token))
      my_move = two_of_three(@token)
    elsif two_of_three(@opp_token) && @board.valid_move?(two_of_three(@opp_token))
      my_move = two_of_three(@opp_token)
    else
      @board.cells.each_with_index do |cell, i| 
        if cell == " "
          my_move = (i + 1)
          break
        end  
      end
    end
    
    my_move
  end

  
  
  
  
  def two_of_three(token)
    tokens = current_tokens(token)
    my_move = false
    
    WINNING_ROWS.each do |row|
      if (row - tokens).size == 1
        my_move = (row - tokens).first
        break
      end
    end
    
    my_move
  end
  
  
  
  
  def current_tokens(token)
    tokens = []
    @board.cells.each_with_index do |cell, cell_index|
      tokens << (cell_index + 1) if cell == token
    end
    
    tokens
  end
  
end