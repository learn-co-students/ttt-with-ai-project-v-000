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
    @board = board
   @player_1 = player_1
   @player_2 = player_2
 end

 def current_player
   board.turn_count.even? ? @player_1 : @player_2
  end

 def over?
   draw? || !!won?
 end

 def won?
   WIN_COMBINATIONS.detect do |win|
    board.cells[win[0]] == board.cells[win[1]] && board.cells[win[2]] == board.cells[win[0]] && (board.cells[win[1]] == "X" || board.cells[win[1]] == "O")
  end
 end

 def draw?
   @board.full? && won? == nil
 end

 def winner
  if combo = won?
    board.cells[combo[0]]
   end
 end

 def turn
   input = current_player.move(board)
   board.valid_move?(input) ? input : turn
   board.update(input, current_player)
   board.display
   #binding.pry
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

def start
  puts "Welcome to Tic Tac Toe!"
  puts "How Many Players (0, 1, 2)"
  input = gets.strip
  if input == "2"
    game = Game.new
  elsif input == "1"
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  elsif input == "0"
    game = Game.new(Players.Computer.new("X"), Players::Computer.new("O"))
  end
  @board.display
  play

end


end
