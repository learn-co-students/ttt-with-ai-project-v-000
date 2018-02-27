require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  
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
  
  def initialize(player_1 =Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.detect do|combo|
      board.taken?(combo[0]+1) &&
      board.cells[combo[0]] == board.cells[combo[1]] &&
      board.cells[combo[1]] == board.cells[combo[2]]
    end
  end
  
  def draw?
    !won? && board.full?
  end
  
  def winner
    winning_token = won?
    won? && board.cells[winning_token[0]]
  end
  
  def turn
    input = current_player.move(board)
    if board.valid_move?(input)
      puts "#{current_player.token} moved to cell #{input}".cyan
      board.update(input, current_player)
      board.display
    else
      puts "That move is invalid!".red
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!".blue
    elsif draw?
      puts "Cat's Game!".yellow
    end
  end
  
end