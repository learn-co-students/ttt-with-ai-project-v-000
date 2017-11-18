class Game

  attr_accessor :player_1, :player_2, :board

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def current_player
    self.board.turn_count.even? ? player_1 : player_2
  end

  def over?
    draw? || won? || self.board.full?
  end

  def won?
    WIN_COMBINATIONS.any? do|combo|
      if self.board.taken?(combo[0]+1) && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[0]] == self.board.cells[combo[2]]
        return combo
      end
    end
  end

  def draw?
    !won? && self.board.full?
  end

  def winner
    if combo = won?
      self.board.cells[combo[0]]
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
    else
      puts "Invalid move!"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
