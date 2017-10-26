class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
     [0,1,2], #first row
     [3,4,5], #second row
     [6,7,8], #third row
     [0,3,6], #first column
     [1,4,7], #second column
     [2,5,8], #third column
     [0,4,8], #Right diagonal
     [2,4,6] #Left diagonal
   ]

   def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
     @board = board
     @player_1 = player_1
     @player_2 = player_2
   end

   def current_player
     board.turn_count % 2 == 0 ? @player_1 : @player_2
   end

   def won?
     WIN_COMBINATIONS.detect do |combo|
       mapped_cells = combo.map {|i| board.cells[i]}
       if mapped_cells.count(mapped_cells.first) == 3 && mapped_cells.first != ' '
         combo
       else
         false
       end
     end
   end

   def draw?
     !won? && @board.full?
   end

   def over?
     @board.full? || won? || draw?
   end

   def winner
     if won?
       return @board.cells[won?[1]]
     end
   end

   def turn
     player = current_player
     user_input = player.move(@board)
     if @board.valid_move?(user_input)
       @board.update(user_input, player)
       @board.display
     else
       turn
     end
   end

   def play
     until over?
       turn
     end
     if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
   end

 end
