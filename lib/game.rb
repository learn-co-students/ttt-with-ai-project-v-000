class Game

attr_accessor :board, :player_1, :player_2

def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
 end
 

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal left
  [2,4,6]  # Diagonal right
]

def current_player
if self.board.turn_count.even?
  @player_1
else
  @player_2
end
end

def over?
won? || draw?
end

 def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
   @player_1 = player_1
   @player_2 = player_2
   @board = board
 end
   def won?
     WIN_COMBINATIONS.detect do |combination|
       (board.cells[combination[0]] == board.cells[combination[1]] && 
       board.cells[combination[1]] == board.cells[combination[2]]) && 
       board.cells[combination[0]] != " "
     end
   end
 
 def draw?
board.full? && !won?
end

def winner
     WIN_COMBINATIONS.each do |combo|
     return "X" if combo.all? {|position| board.cells[position] == 'X'}
     return "O" if combo.all? {|position| board.cells[position] == 'O'}
   end
   return nil
 end

def play
  until over?
    turn
  end
end

def turn

end



end
