class Game 
  # extend Players
  include Players
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top-row win
    [3, 4, 5], #mid-row win
    [6, 7, 8], #bot-row win 
    [0, 3, 6], #left-col win 
    [1, 4, 7], #mid-col win
    [2, 5, 8], #right-col win 
    [0, 4, 8], #cross-right win 
    [6, 4, 2] ]#cross-left win 

 def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

 def won? 
    WIN_COMBINATIONS.any? do |combo|
       if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"} 
         true 
      elsif @board.full?
        false 
      else 
        false
       end
     end
 end

 def win_combo #returns winning combination
   WIN_COMBINATIONS.each do |combo|
      if combo.all? {|i| @board.cells[i] == "X"} || combo.all? {|i| @board.cells[i] == "O"} 
        return combo 
      end
    end
  end 
   
 def winner  #returns "X" or "O" string
   if over?
     @board.cells[win_combo[0]] == "X" ? "X" : "O"
   else 
     nil
   end
 end

 def draw?
    !self.won? && @board.full? ? true : false
  end

 def over?
    if self.won? || self.draw?
      true 
    elsif !@board.full? 
      false
   end
  end

 def turn 
   input = self.current_player.move(@board)
     if @board.valid_move?(input)
       @board.update(input, self.current_player)  
     else 
       input = self.current_player.move(@board)
     end
  end

 def play
     turn until self.over?
     puts "Congratulations #{@winner}!"
end

  
end
