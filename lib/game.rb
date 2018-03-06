require 'pry'

class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [2,5,8],
    [1,4,7],

    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    #binding.pry
    @board = board
   @player_1 = player_1
   @player_2 = player_2
 end

 def current_player
   board.turn_count.even? ? @player_1 : @player_2
  end

 def over?
   #binding.pry
   draw? || !!won?
 end

 def won?
   #binding.pry
  WIN_COMBINATIONS.detect do |win|
    #binding.pry
    board.cells[win[0]] == board.cells[win[1]] && board.cells[win[2]] == board.cells[win[0]] && (board.cells[win[1]] == "X" || board.cells[win[1]] == "O")
  end
 end

 def draw?
   #binding.pry
  @board.full? && won? == nil
 end

 def winner
   #binding.pry
  if combo = won?
    board.cells[combo[0]]
    #binding.pry
  end
 end

 def turn
   input = current_player.move(board)
   board.valid_move?(input) ? input : turn
   board.update(input, current_player)
 end

 def play
   while !over?
    turn
  end
 if won?
    puts "Congratulations #{winner}!"
  end
 if draw?
   puts "Cat's Game!"
 end
end



end
