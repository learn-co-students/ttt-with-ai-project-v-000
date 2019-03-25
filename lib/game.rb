require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  
    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board
    end
    
    def current_player
      @board.turn_count.odd? ? @player_2 : @player_1
    end
   def won? 
    
    winner = ""
    WIN_COMBINATIONS.each do |win_combo|
      if win_combo.all? {|i| @board.cells[i] == "X"} || win_combo.all? {|i| @board.cells[i] == "O"}
        winner = win_combo
      end
    end
    winner != "" ? winner : FALSE
   end
   
   def draw?
    !won? && board.full? == true ? true : false
   end
   
   def over?
   won? != false || draw? == true ? true : false
  end
  
  def winner
    won? ?  @board.cells[won?[0]] : nil
   end

def turn 
  input = current_player.move(@board)
  if @board.valid_move?(input)
    @board.update(input, current_player)
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