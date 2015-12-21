class Player::Computer < Player
  attr_accessor :cpu

  def move(board)
    if board.turn_count > 0 
      self.minimax(board, 9)
    else
      self.minimax(board, 5)
    end 
    self.cpu
  end 

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_pos1 = combo[0]
      win_pos2 = combo[1]
      win_pos3 = combo[2]

      position1 = self.board.cells[win_pos1]
      position2 = self.board.cells[win_pos2]
      position3 = self.board.cells[win_pos3]

      if (position1 == "X" && position2 == "X" && position3 == "X") || (position1 == "O" && position2 == "O" && position3 == "O")
        return combo
      end
    end
    return false
  end

  def over?
    if full?(board) || won?(board) || draw?(board)
      return true
    end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def score(board, depth)
    if self.game.won?(@cpu)
      return 10 - depth
    elsif self.game.win?(@player_one)
      return depth - 10
    else
      return 0
    end
  end

  def minimax(board, depth)
    return score(board, depth) if over?
    depth += 1
    scores = [] 
    moves = []  

   
  end
end