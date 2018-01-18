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

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    # binding.pry
    @board = board
  end

  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end

  def over? # can probly do a lamda; or maybe just draw/won.
    draw? || !!won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[0]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0] + 1)
    end
  end

  def draw?
    !!won? ? false : @board.full?
  end

  def winner
    if won = won?
      board.cells[won.first]
    end
  end

  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display()
    else
      # puts "Invalid move. Please try again."
      turn
    end
  end

  def play
    until over? do
      turn
    end
    if !!won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

#scan the board, return index numbers where board[index]= open

end
