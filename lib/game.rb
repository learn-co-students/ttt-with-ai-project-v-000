require 'pry'
class Game

  attr_accessor :player_1, :player_2, :board


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
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    board = Board.new
  end

  def current_player
    # binding.pry
    if board.turn_count.even?
      @player_1
    else
      @player_2
    end
  end

  def over?
    # binding.pry
     draw? || won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (board.cells[combo[0]]) == "X" && (board.cells[combo[1]]) == "X" && (board.cells[combo[2]]) == "X" || (board.cells[combo[0]]) == "O" && (board.cells[combo[1]]) == "O" && (board.cells[combo[2]]) == "O"
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    WIN_COMBINATIONS.detect do |combo|
      if (board.cells[combo[0]]) == "X" && (board.cells[combo[1]]) == "X" && (board.cells[combo[2]]) == "X"
        return "X"
      elsif (board.cells[combo[0]]) == "O" && (board.cells[combo[1]]) == "O" && (board.cells[combo[2]]) == "O"
        return "O"
      end
    end
  end

  def turn
    # binding.pry
    puts "Enter your move (1-9)"
    playermove = current_player.move(board)
    if board.valid_move?(playermove)
      board.update(playermove, current_player)
    else
      puts "Please make a valid move"
      turn
    end
    board.display
  end

  def play
    # Game.new
    # binding.pry
    until (over?)
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
