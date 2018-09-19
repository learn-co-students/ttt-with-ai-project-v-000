class Game
  attr_accessor :player_1, :player_2, :board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.board = board
    self.player_1 = player_1
    self.player_2 = player_2
  end

  def current_player
    if self.board.turn_count % 2 == 0
      if self.player_1.token == "X"
        return self.player_1
      else
        return self.player_2
      end
    else
      if self.player_1.token == "O"
        return self.player_1
      else
        return self.player_2
      end
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if board.taken?(combo[0] + 1) && (board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]])
        return combo
      end
    end
    return false
  end

  def draw?
    board.full? && !self.won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      return self.board.cells[self.won?.first]
    else
      return nil
    end
  end

  def turn
    puts "Please choose an empty space 1-9."
    move = current_player.move(self.board).to_i
    if board.valid_move?(move)
      self.board.cells[move - 1] = current_player.token
      board.display
    else
      turn
    end
  end

  def play
    turn until over?
    if self.winner == "X"
      puts "Congratulations X!"
    elsif self.winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
