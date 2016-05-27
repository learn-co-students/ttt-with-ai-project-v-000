class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2, :token, :save_winner

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @counts = { " " => 9, "X" => 0, "O" => 0 }
  end

  def current_player
    self.board.turn_count.even? ?
    player_1 : player_2
  end

  def over?
    self.board.full?
  end

  def won?
  # loop through board and collect the winning combination indices
  # loop through win combinations - collect the tokens - all Xs or Os?
  # { win_combo => {"X", "X", O"}}
    won = false
    WIN_COMBINATIONS.each_with_index do |win_combo, index|
      if self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[0]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[2]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
        won = true
      else
        self.save_winner = nil
      end
    end
    won
  end

  def draw?
    over? && !won?
  end

  def winner
    if won? == true
      self.board.cells
    end
  end

  def turn

  end

  def play

  end


end
