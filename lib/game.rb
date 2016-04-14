require 'pry'
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
  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    
  end
  

  def move(*board)
      puts "Hi what's your move"
      move = gets.chomp
     end
  
  def valid_move?(position)
    position = position.to_i - 1 
  
  if   !position.between?(0, 8)  
   false
  elsif self.board.cells[position] == " "
    true
 
  
  end 
end
  
  def turn
   puts  "please enter 1-9"
   position = gets.strip
    if valid_move?(position)
     move(*board)
    else
    turn
    end
   board
  end

  def turn_count
    self.board.cells.count {|token| token == " X " || token == " O "}
  
  end

  def current_player
  self.turn_count % 2 == 0
   if self.turn_count.even?
     player_1
   else
    player_2

   end
  end
  
  def full?
    self.board.cells.all? do |board| 
      if board == " " 
        false
      else
        true
      end
    end
  end

  
  def won?
  
  WIN_COMBINATIONS.detect do |win_combination|
    self.board.cells[win_combination[0]] == self.board.cells[win_combination[1]] && self.board.cells[win_combination[1]] == self.board.cells[win_combination[2]]
   end
  end
  
  def draw?
   if full? && !won?
   true
  else 
    false
  end
 end 

 def over?
   if  draw? || won? 
    true
    else
     false
   end
 end
  

  def winner
    if won?
      WIN_COMBINATIONS.detect do |win_combination|
        if self.board.cells[win_combination[0]] == "X" && self.board.cells[win_combination[1]] == "X" && self.board.cells[win_combination[2]] == "X"
          return  "X"
 elsif
  self.board.cells[win_combination[0]] == "O" && self.board.cells[win_combination[1]] == "O" && self.board.cells[win_combination[2]] == "O"
      return  "O"
    else
      nil
    
    end
  end
  end
  end

end