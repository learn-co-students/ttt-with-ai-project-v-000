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
    WIN_COMBINATIONS.detect do |win_combination|
      windex_1 = win_combination[0]
      windex_2 = win_combination[1]
      windex_3 = win_combination[2]
      position_1 = @board.cells[windex_1]
      position_2 = @board.cells[windex_2]
      position_3 = @board.cells[windex_3]
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
    !!won? ? false : @board.full?
  end

  def winner
    !!won? ? @board.cells[won?[0]] : nil
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
