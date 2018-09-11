class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #left_column_win
    [1,4,7], #middle_column_win
    [2,5,8], #right_column_win
    [0,4,8], #diagonal_LtoR_win
    [2,4,6], #diagonal_RtoL_win
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2= Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count.odd? ? self.player_2 : self.player_1
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
     self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] &&
     self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]] &&
     self.board.taken?(win_combination[0]+1)
   end
  end

  def draw?
    self.board.full? && !self.won?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    if self.won?
      win_index = self.won?
      self.board.cells[win_index[0]]
    end
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
    else
      turn
    end
  end

  def play
    until self.over?
      self.turn
    end
    if won?
      puts "Congratulations #{self.winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end
