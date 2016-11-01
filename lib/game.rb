class Game
 attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [ [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]]
   def initialize(player1 =Players::Human.new('X'),player2=Players::Human.new('O'),board=Board.new)
     @player_1=player1
     @player_2=player2
     @board=board
   end


 def turn_count
   count=0
 @board.cells.each do | element |
   if element == 'X' || element == 'O'
      count += 1
    end
  end
    return count
  end

 def current_player
   n=turn_count
   if n.even?
      return @player_1
   else
        return @player_2
    end
 end

 def won?

   WIN_COMBINATIONS.each do |win_combination|

   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]
   position_1 = board.cells[win_index_1]
   position_2 = board.cells[win_index_2]
   position_3 = board.cells[win_index_3]
   if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X' ) || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O' )
      return win_combination
   end
 end
 return false
 end



 def full?()
 return   !@board.cells.any?  { |element| element == " " || element == ""}
 end

 #if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won
 def draw?
   if won?
      return false
   elsif full?
        return true
   else
       return false

   end
 end

 #returns true if the board has been won, is a draw, or is full
 def over?
   if won? || draw? || full?
     return true
   else
      return false
   end
 end

 def winner
   wincom = won?
   if wincom == false
       return nil
   else
       return @board.cells[wincom[0]]
 end
 end

 def position_taken?(index)
   if index == nil || index == "" || index == " " || @board.cells[index] == nil || @board.cells[index] == " " || @board.cells[index] == ""
     return false
   else
     return true
   end
 end

 def turn

   n = current_player.move(board)
   puts current_player
   ##puts "Please enter 1-9:"
   ##n = gets.strip
   ##index= input_to_index(n)
   ##binding.pry
   if @board.valid_move?(n) == false
      puts "Please enter valid move"
    ##  binding.pry
      turn
    end
    @board.update(n, current_player)
    @board.display
    ##binding.pry
end

def input_to_index(n)
   return n.to_i - 1
end

def play
  until over?
  puts "turn of the game player " + current_player.token
       turn
   end
 if won?
    if winner == 'X'
        puts "Congratulations X!"
    elsif  winner == 'O'
         puts "Congratulations O!"
    end
elsif  draw?
  puts "Cats Game!"
end
end


def start
puts "Welcome to TicTacToe"

puts "What kind of game you would like to play"
puts "0, 1 or 2 player game or wargame"
n = gets.chomp
if n == "wargame"
   wargame
end
puts n
if n.to_i == 0
  computer1 = Players::Computer.new('X')
  computer2 = Players::Computer.new('O')
  board=Board.new
  game=Game.new(computer1,computer2,board)
elsif n.to_i == 1
  puts "in else 1"
  player_1 = Players::Human.new('X')
  computer2 = Players::Computer.new('O')
  board=Board.new
  game=Game.new(player_1,computer2,board)
else
  player1 = Players::Human.new('X')
  player2 = Players::Human.new('O')
  board=Board.new
  game=Game.new(player1,player2,board)
end
board.display
puts "displayih players"
puts game.player_1
puts game.player_2
puts "starting game"
game.play
end

def wargame
  n = 1
  result = []
  while n <=5
    puts "starting n= " + n.to_s
    g = gets
    computer1 = Players::Computer.new('X')
    computer2 = Players::Computer.new('O')
    board = Board.new
    game=Game.new(computer1,computer2,board)
    game.play
    puts winner
    result << n.to_s +" : " + winner 
    n = n + 1
end
board.reset!
board=nil
game=nil
computer1=nil
computer2=nil
puts result.to_s
puts n
end

end
