require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2, :token

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end
  
  def current_player
    # use instance variable board, because #turn_count is an 
    # instance method
    @board.turn_count.even? ? player_1 : player_2
  end
  
  def draw?
    @board.full? && !won?
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
        @board.cells[combo[0]] == @board.cells[combo[1]] &&
        @board.cells[combo[1]] == @board.cells[combo[2]] &&
        (@board.cells[combo[0]] == "X" || @board.cells[combo[0]] == "O")
    end
  end

  def over?
    won? || draw?
  end
  
  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end
  
  def turn 
    input = current_player.move(board)
    index = input.to_i
    if !@board.valid_move?(input)
     turn 
    else 
      @board.update(input, current_player)
    end 
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else puts "Cat's Game!"
    end
  end

end

