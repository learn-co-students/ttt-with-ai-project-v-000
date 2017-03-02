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
  [2,4,6]  # left diagonal 7
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

  def won?() #Fixed! Switched to WIN_COMBINATIONS.each do |x| :)
    WIN_COMBINATIONS.each do |box|
      if @board.cells[box[0]] == "X" && @board.cells[box[1]] == "X" && @board.cells[box[2]] == "X" #way to use .all??
    return box
  elsif @board.cells[box[0]] == "O" && @board.cells[box[1]] == "O" && @board.cells[box[2]] == "O"
        return box #just returns "X" or "O"
      end
    end
   false
  end

  def draw?
  	board.full? && !won?
  end

  def winner
    !!won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "Please enter 1-9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display()
    else
      puts "Invalid move. Please try again."
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
