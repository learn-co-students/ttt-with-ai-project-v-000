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
   @player_1 = player_1
   @player_2 = player_2
   @board = board
 end

 def current_player
   board.turn_count % 2 == 0 ? @player_1 : @player_2
 end

 def over?
   draw? || won?
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

 def winner
   if won?
     return board.cells[won?[0]]
   else
     return nil
   end
 end

 def turn
   player = current_player
   players_move = player.move(board)
   if board.valid_move?(players_move)
     board.update(players_move, player)
     puts "#{player.token} moved in position #{players_move}"
     board.display
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
end
