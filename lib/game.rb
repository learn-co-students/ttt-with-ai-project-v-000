class Game

  attr_accessor :board, :player_1, :player_2

WIN_COMBINATIONS = [
   [0,1,2],
   [0,3,6],
   [0,4,8],
   [1,4,7],
   [2,4,6],
   [2,5,8],
   [3,4,5],
   [6,7,8]
]


def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
end


def current_player
  if @board.turn_count.even?
    @player_1
  else
    @player_2
  end
end

def won?
   WIN_COMBINATIONS.each do |combo|
     x = 0
     o = 0
     combo.each do |i|
       if board.cells[i] == "X"
         x += 1
       elsif board.cells[i] == "O"
         o += 1
       end
     end
     return combo if x == 3 || o == 3
   end
   false
 end


 def draw?
   @board.full? && !self.won?
 end

 def over?
   if  self.won? || self.draw?
     return true
   else
     return false
   end
 end

 def winner
   WIN_COMBINATIONS.each do |combo|
     x = 0
     o = 0
     combo.each do |i|
       if board.cells[i] == "X"
         x += 1
       elsif board.cells[i] == "O"
         o += 1
       end
     end
     if x == 3
       return "X"
     elsif o == 3
       return "O"
     end
   end
    nil
 end


 def turn
   puts "Where would you like to go? [1-9]"
   input = current_player.move(board).to_i
   @board.valid_move?(input) ? @board.update(input, current_player) : turn
   @board.display
   self.current_player
 end


 def play
  until self.over? do
    self.turn
  end
  puts "Congratulations X!" if winner == "X"
  puts "Congratulations O!" if winner == "O"
  puts "Cat's Game!" if draw?
end










end
