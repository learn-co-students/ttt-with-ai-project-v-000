class Game
   attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

   def initialize(player_1 = Players::Human.new("X"), player_2 =Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     @board.turn_count.even? ? player_1 : player_2
   end

   def won?
      WIN_COMBINATIONS.detect do |winner|
        @board.cells[winner[0]] == @board.cells[winner[1]] &&
        @board.cells[winner[1]] == @board.cells[winner[2]] &&
        (@board.cells[winner[0]] == "X" || @board.cells[winner[0]] == "O")
        #binding.pry
      end
   end

   def draw?
     @board.full? && !won?
   end

   def over?
    draw? || won?
   end

   def winner
     if combo = won?
     @winner = @board.cells[combo.first]
     end
   end

   def turn
     player = current_player
     current_move = player.move(@board)

     if !@board.valid_move?(current_move)
       turn
     else
       @board.update(current_move, player)
       @board.display
       puts "#{player.token} moved to #{current_move}"
     end
   end

   def play
       until over?
         turn
       end

       if won?
         puts "Congratulations #{winner}!"
       elsif draw?
         puts "Cat's Game!"
       end
     end
 end
