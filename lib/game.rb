require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  attr_reader :WIN_COMBINATIONS

    WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [0, 4, 8],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6]
  ]

  def initialize(player_1=Players::Human.new("X") , player_2=Players::Human.new("O"), board= Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def won?
    winning_array = []
     WIN_COMBINATIONS.each do |win_combination|
       position_1 = @board.cells[win_combination[0]]
       position_2 = @board.cells[win_combination[1]]
       position_3 = @board.cells[win_combination[2]]

       if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
         winning_array = win_combination
       end
     end
     winning_array.empty? ? false : winning_array
   end

 def winner
   if self.won? != false
     self.board.cells[self.won?[0]]
   end
 end

 def full?
     @board.cells.none? {|place| place == " "}
 end

 def draw?
   if full?
     if won? != false
       false
     else
       true
     end
   else
     false
   end
 end

 def over?
   if won? != false
     true
   elsif draw?
     true
   else
     false
   end
 end

def turn
 puts "Please enter 1-9:"

   input = self.current_player.move(@board)


   if @board.valid_move?(input) == true
     @board.update(input, self.current_player)
     @board.display
   else
     turn
   end
 end

 def play
   puts "Begin Tic Tac Toe!"
   @board.display
   until self.over? == true
       self.turn
   end
   if self.won? != false
       puts "Congratulations #{self.winner}!"
   else
       puts "Cat's Game!"
   end

 end

end
