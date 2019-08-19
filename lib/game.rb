require 'pry'
class Game
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  attr_accessor :board, :player_1, :player_2


  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    self.board.cells.count{|cell| cell == " "}.odd? ? @player_1 : @player_2
  end

  def over?
    won? || draw?
  end

  def won?
    board = self.board.cells
    winning_combination = []
    WIN_COMBINATIONS.each do |combo|
      test_row = [ board[combo[0]], board[combo[1]], board[combo[2]] ]
      if test_row == ["X", "X", "X"] || test_row == ["O", "O", "O"]
        winning_combination << combo
      end
    end
    winning_combination[0]
    # not sure I agree with game.board.cells for the test.  A real game board would not have two winning combinations: (2,5,8) and (0,4,8).
    # Updated the method to return the first winning combination.
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    if won?
      self.board.cells[won?[0]]
    end
  end

  def turn
    current_turn = current_player.move(board)
    if self.board.valid_move?(current_turn)
      self.board.update(current_turn, current_player)
      current_turn
    else
      self.turn
    end
  end

  def play
    board.display
    while !over?
      turn
      board.display
    end
      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
        current_player
      end
  end

end
