class Game
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
  attr_accessor :board, :player_1, :player_2


  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    a = self.board.cells.count{|a| a == "X" || a == "O"}
    if a % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
    self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
    end
  end

  def draw?
    # a = self.board.cells.all?{|a| a == "X" || a == "O"}
    self.board.full? && !won? 
  end

  def over?
    draw? || won?
  end

  def winner
    if self.board.cells.count("X") > self.board.cells.count("O")
      "X"
    elsif self.board.cells.count("X") < self.board.cells.count("O")
      "O"
    else
      nil
    end
  end

  def turn
    a = self.current_player.move(self.board)
    self.board.update(a, self.current_player)
  end

  def play
    until self.over?
      turn
    end
      if self.winner == "X"
        puts "Congratulations X!"
      elsif self.winner == "O"
        puts "Congratulations O!"
      elsif self.draw?
        puts "Cat's Game!"
      end



  end



end
