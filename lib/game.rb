require 'pry'

class Game

  attr_accessor  :board, :player_1, :player_2

  WIN_COMBINATIONS = [
  [0,1,2], # Top row 0
  [3,4,5], # Middle row 1
  [6,7,8], # bottom row 2

  [0,3,6], # left column 3
  [1,4,7], # middle column 4
  [2,5,8], # right col 5

  [0,4,8], # right diagonal 6
  [2,4,6] # left diagonal 7
  ]
  #aside from spec, no fucking clue where this Players::Human format came from
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def over? # can probly do a lamda; or maybe just draw/won.
    draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.cells[win_index_1]
      position_2 = @board.cells[win_index_2]
      position_3 = @board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_combination
      else
        false
      end
    end
  end

  def draw?
  	board.full? && !won?
  end

  def winner
    !!won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    @input = current_player.move(board)
    if board.valid_move?(@input)
      board.update(@input, current_player)
      board.display()
    else
      turn                          #invoke turn again
    end
  end

  def play
      until over? do
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end

end
