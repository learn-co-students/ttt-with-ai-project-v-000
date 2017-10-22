class Game

  WIN_COMBINATIONS = [
    [0,1,2], #top_row_win
    [3,4,5], #middle_row_win
    [6,7,8], #bottom_row_win
    [0,3,6], #column_1_win
    [1,4,7], #column_2_win
    [2,5,8], #column_3_win
    [0,4,8], #diagonal_1_win
    [2,4,6] #diagonal_2_win
  ]

  def initialize(player1 = Players::Human.new("X"), player2 = Players::Human.new("O"), board=Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = board
  end

  attr_accessor :player_1, :player_2, :board
  attr_writer :winner

  def current_player
    self.board.turn_count%2 == 0 ? player_1 : player_2
  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.any? {|each| won_winner_helper(each)}
  end

  def won_winner_helper(arr)
    #for each win combination
    #check each index for board.cellls and see if they all match
    winner_x = arr.all?{|each| self.board.cells[each] == "X" }
    winner_o = arr.all?{|each| self.board.cells[each] == "O"}
    if winner_x
      self.winner = "X"
    elsif winner_o
      self.winner = "O"
    end
    winner_x || winner_o
  end

  def draw?
    self.board.full? && !self.won?
  end

  def winner
    self.won?
    @winner
  end

  def turn
    input = self.current_player.move(self.board)
    if self.board.valid_move?(input)
      self.board.cells[input.to_i-1] = self.current_player.token
      self.board.display
    else
      turn
    end
  end

  def play
    until over?
      self.turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{self.winner}!"
    end
  end
end
