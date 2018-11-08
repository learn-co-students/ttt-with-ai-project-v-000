require 'pry'

class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row

  [0,4,8],  #first diagonal
  [2,4,6],  #second diagonal

  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8]  # Bottom column

]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def board=(board)
    @board = board
  end

  def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
  end

  def won?
      temp = WIN_COMBINATIONS.select { |x| @board.cells[x[0]] != " " && @board.cells[x[0]] == @board.cells[x[1]] && @board.cells[x[0]] == @board.cells[x[2]] }
      temp == [] ? false : temp[0]
  end

  def draw?
    @board.full? && !self.won? ? true : false
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    self.won? ? @board.cells[self.won?[0]] : nil
  end

  def turn
      player = self.current_player
      current_move = player.move(@board)

      if @board.valid_move?(current_move)
        @board.display
        @board.update(current_move, player)
        @board.display
      else
        turn
      end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
