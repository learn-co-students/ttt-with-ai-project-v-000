require "pry"

class Game
  attr_accessor :board, :player_1, :player_2, :timer

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), board = Board.new)
    @player_1 = p1
    @player_2 = p2
    @board = board
  end

  def board
    @board
  end
  
  def current_player
    board.turn_count.even? ? @player_1 : @player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end
  
  def draw?
    board.full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    board.cells[won?[0]] if won?
  end
  
  def turn
    puts "It's now player #{current_player.token}'s turn."
    puts "Please enter 1-9:"
    
    input = current_player.move(board)
    
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else 
      puts "That is an invalid move"
      turn
    end
  end
  
  def play
    
    turn until over?
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
    board.display
  end
  
end