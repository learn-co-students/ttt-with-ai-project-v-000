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
   [6,4,2]
 ]

 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
 end

 def current_player
    @board.turn_count % 2 == 0 ? @player_1 : @player_2
 end

 def over?
    won? || draw?
 end

 def won?
   WIN_COMBINATIONS.detect do |combo|
     @board.cells[combo[0]] == @board.cells[combo[1]] &&
     @board.cells[combo[1]] == @board.cells[combo[2]] &&
     @board.taken?(combo[0]+1)
   end
 end

 def draw?
  !won? && @board.full?
 end

 def winner
  if won?
    @board.cells[won?.first]
  end
 end

 def turn
   player = current_player
   current_move = player.move(@board)
   if @board.valid_move?(current_move)
     @board.update(current_move, player)
     @board.display
   else
     turn
   end
 end

 def play
   while !over?
     turn
   end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
 end

 def start
   puts "How many player(s)? Please enter 0-2:"
   player_count = gets.strip
   if player_count == "0"
     @player_1 = Players::Computer.new("X")
     @player_2 = Players::Computer.new("O")
     play
   elsif player_count == "1"
     puts "Please choose your token (X/O):"
     token = gets.strip
     if token.upcase == "X"
       @player_1 = Players::Human.new("X")
       @player_2 = Players::Computer.new("O")
       play
     elsif token.upcase == "O"
       @player_1 = Players::Computer.new("X")
       @player_2 = Players::Human.new("O")
       play
     end
   elsif player_count == "2"
     puts "Player 1 is X, Player 2 is O."
     @player_1 = Players::Human.new("X")
     @player_2 = Players::Human.new("O")
     play
   else
     puts "Please reenter your response (0-2):"
     start
   end
 end
end
