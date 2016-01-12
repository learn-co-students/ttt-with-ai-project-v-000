require 'pry'

class Game
  attr_accessor :player_1, :player_2, :board
  
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],
    [6,7,8],[0,3,6],
    [1,4,7],[2,5,8],
    [0,4,8],[6,4,2]
  ]

  
  def initialize(player_1 = nil ,player_2 = nil ,board = nil)
    player_1 = Human.new("X") if player_1 == nil
    player_2 = Human.new("O") if player_2 == nil
    board = Board.new if board == nil

    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.cells[combo[0]] == board.cells[combo[1]] && 
      board.cells[combo[1]] == board.cells[combo[2]] &&
      board.taken?(combo[0] + 1)
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      board.cells[winning_combo[0]] 
    end
  end

  def turn
    puts "Please enter 1 - 9:"
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
    else
      puts "\nInvalid move\n"
      turn
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cats Game!"
    end
  end
end


