class Player::Computer < Player
  
  WINNING_ROWS = [
    [1,2,3],[4,5,6],[7,8,9],
    [1,4,7],[2,5,8],[3,6,9],
    [1,5,9],[7,5,3]
  ]
  
  def move(board)
    @board = board
    
    case @board.turn_count
    when 0
      first_move.to_s
    when 1
      second_move.to_s
    when 2
      third_move.to_s
    when 3
      fourth_move.to_s
    else
      rest_of_moves.to_s
    end
  end

  
  def first_move
    @my_first_x = 5
  end
  
  
  def second_move
    @opp_first_x = first_token_placement
    @opp_first_x == 5 ? @my_first_o = [1, 3, 7, 9].sample : @my_first_o = 5
    
    @my_first_o
  end
  
  
  def third_move
    @opp_first_o = first_token_placement
    
    if @opp_first_o.even?
      edge_response = {2 => [7, 9], 4 => [3, 9], 6 => [1, 7], 8 => [1, 3]}
      @my_second_x = edge_response[@opp_first_o].sample
    else
      corner_response = {1 => 9, 9 => 1, 3 => 7, 7 => 3}
      @my_second_x = corner_response[@opp_first_o]
    end  
    
    @my_second_x
  end
  
  
  def fourth_move
    xs = []
    corners = [1, 3, 7, 9]
    opposite_corner_to = {1 => 9, 9 => 1, 3 => 7, 7 => 3}
    @board.move_history.each_with_index { |square, i| xs << (square + 1) if i.even? }
    
    #see if opponent can win. If so, block it.
    if can_win_with(@opp_token)
      @my_second_o = can_win_with(@opp_token)
      
    #choose a vacant corner if there is a diagonal line in play  
    elsif xs.include?(5) && xs.include?(opposite_corner_to[@my_first_o])
      @my_second_o = corners.reject! do |corner|
        corner == @my_first_o || corner == opposite_corner_to[@my_first_o]
      end.sample
      
    else
      @my_second_o = first_empty_cell
    end
    
    @my_second_o
  end  
  
  
  def rest_of_moves
    
    if can_win_with(@token)
      my_move = can_win_with(@token)
      
    elsif can_win_with(@opp_token)
      my_move = can_win_with(@opp_token)
      
    else
      my_move = first_empty_cell
    end
    
    my_move
  end

  
  def can_win_with(token)
    my_move = false
    tokens = current_tokens(token)
    
    WINNING_ROWS.each do |row|
      if (row - tokens).size == 1
        possible_move = (row - tokens).first
        if @board.valid_move?(possible_move)
          my_move = possible_move
          break
        end
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
  
  
  def first_token_placement
    @board.cells.find_index { |cell| cell == @opp_token } + 1
  end
  
  
  def first_empty_cell
    empty_index = @board.cells.index do |cell|
      cell == " "
    end
    
    empty_index + 1
  end
  
end