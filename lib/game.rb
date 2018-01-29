require 'pry'
 class Game
   #extend Players::Human
  attr_accessor :board, :player_1, :player_2
   attr
   WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]]

   def initialize(player_1 = Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board || Array.new(9, " ")
  end

   def current_player
     @board.turn_count % 2 == 0 ? @player_1 : @player_2
   end

     def over?
      self.won? || self.draw?
     end

  def won?
     WIN_COMBINATIONS.detect do |win|
       @board.cells[win[0]] == @board.cells[win[1]] &&
       @board.cells[win[1]] == @board.cells[win[2]] &&
       @board.taken?(win[0]+1)
     end
   end

   def draw?
     !(won?) && (@board.full?)
   end

   def winner
    if  win = won?
     @board.cells[win.first]
    end
   end

     def turn
       x = current_player.move(@board)
       if @board.valid_move?(x)
          @board.display
          @board.update(x, current_player)
          @board.display
       else !@board.valid_move?(x)
         turn
       end

     end

     def play
       until over?
         turn
       end
       if won?
         puts "Congratulations " + winner + "!"
       else
         draw?
         puts "Cat's Game!"
       end
     end





 end
