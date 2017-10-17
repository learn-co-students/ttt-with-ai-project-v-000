class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    self.player_1 = player_1
    self.player_2 = player_2
    self.board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      self.player_1
    else
      self.player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winning_combo|
      if winning_combo.all? {|index| self.board.cells[index] == "X"}
        return winning_combo
      elsif winning_combo.all? {|index| self.board.cells[index] == "O"}
        return winning_combo
      end
    end
    false
  end

  def draw?
    if self.board.turn_count == 9 && self.won? == false
      true
    else
      false
    end
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      if self.won?.all? {|index| self.board.cells[index] == "X"}
        "X"
      elsif self.won?.all? {|index| self.board.cells[index] == "O"}
        "O"
      end
    else
      nil
    end
  end

  def turn
    input = self.current_player.move(board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      input = self.current_player.move(board)
    end
  end

  def play
    self.turn while self.over? != true
    if self.won?
      puts "Congratulations #{self.winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
