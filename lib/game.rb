require "pry"
class Game
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
 ]
 
  def current_player
   board.turn_count % 2 == 0 ? player_1 : player_2
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    board.cells[win_combo[0]] == board.cells[win_combo[1]] &&
    board.cells[win_combo[1]] == board.cells[win_combo[2]] &&
    board.taken?(win_combo[0]+ 1)
   end
  end
  
  def draw?
    !won? && board.full?
  end
 
 def over?
   won? || board.full? || draw?
 end
 
 def winner 
    win_combo = won?
    win_combo ? board.cells[win_combo.first] : nil
 end 
 
 
 def turn
   puts "Select 1-9"
    choice = current_player.move(board)
    if board.valid_move?(choice)
      board.update(choice, current_player)
      board.display
    else 
      turn
    end
  end

 def play 
   turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
  end
 end
 
 def self.start 
   puts "Welcome to Tic Tac Toe!"
   puts "Would you like to play '0', '1', or '2' players?"
   input = gets.strip
   
   if input == '0'
    game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"), Board.new)
     elsif input == '1'
     game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
     elsif input == '2'
     game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
     end
     puts "Who would like to go first?"
    until game.won?
     game.play
    end
    
    
 end
 
end