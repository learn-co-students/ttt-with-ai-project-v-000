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
    if self.board.turn_count.even?
      self.player_1
    else
      self.player_2
    end
  end

  def over?
    if self.won? || self.draw?
      true
    else
      false
    end
  end

  def won?
    combo_list = WIN_COMBINATIONS.collect do |combo|
      combo.collect do |index|
        self.board.cells[index]
      end
    end

    winning_combo = combo_list.detect {|combo| combo == ["X", "X", "X"] || combo == ["O", "O", "O"]}
    winning_combo ? winning_combo : false
  end

  def draw?
    if self.board.turn_count == 9 && !self.won?
      true
    else
      false
    end
  end

  def winner
    if self.won?
      self.won?.first
    else
      nil
    end
  end

  def turn
    move = self.current_player.move(self.board)
    if self.board.valid_move?(move)
      self.board.update(move, self.current_player)
    else
      self.turn
    end
  end

  def play
    until self.over?
      self.board.display
      self.turn
    end
    if self.draw?
      self.board.display
      puts "Cat's Game!"
    elsif self.won?
      self.board.display
      puts "Congratulations #{self.winner}!"
    end
  end

end
