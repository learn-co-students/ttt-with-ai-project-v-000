class Computer < Player
  
  def move(board)
    available_moves = (1..9).select { |number| !board.taken?(number) } 
    return win_or_stop_win(board).to_s if win_or_stop_win(board)
    return best_moves(board, available_moves).to_s
  end

  def win_or_stop_win(board)
    marker = self.token
    opponent = ['X', 'O']
    opponent.delete(marker)
    Game::WIN_COMBINATIONS.each do |combo|
      if board.cells.values_at(*combo).count(marker) == 2 && board.cells.values_at(*combo).count(' ') == 1 
        combo.each {|position| return position+1 if board.cells[position] == ' '} 
      elsif board.cells.values_at(*combo).count(opponent[0]) == 2 && board.cells.values_at(*combo).count(marker) != 1 
        combo.each {|position| return position+1 if board.cells[position] == ' '} 
      end
    end
    nil
  end

  def best_moves(board, moves)
    return 5 if moves.include?(5)
    return 1 if moves.include?(1)
    return 3 if moves.include?(3)
    return 7 if moves.include?(7)
    return 9 if moves.include?(9)
    return 4 if moves.include?(4)
    return 6 if moves.include?(6)
    return 8 if moves.include?(8)
    return 2 if moves.include?(2)
  end
end

 