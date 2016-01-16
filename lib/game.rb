class Game
  attr_accessor :board, :player_1, :player_2
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  # ETC, an array for each win combination
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left diagonal
  [2,4,6]  # Right Diagonal
]
  def initialize(player_1=Player::Human.new("X"), player_2=Player::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
 
  def current_player #returns the token of the current player
    if board.turn_count % 2 == 0 
      return self.player_1
    else
      return self.player_2
    end
  end #end of current_player
  
  def over? #returns true if the game board is over
    if board.cells.any?{|cell| cell == " "}
      false
    else
      if draw?
        true
      elsif won?
        true
      end
    end
  end #end of over?
  
  def draw? #returns true for a game that is draw and false for a game won
    if @board.full? && self.won? != true
      return true
    else
      return false
    end      
  end #end of draw?
  
  def won? #returns true for the won game else returns false   
    winning_flag = false
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|win_index| @board.cells[win_index]=="X"} 
        @winning_board_token = "X"
        winning_flag = true
      elsif win_combination.all?{|win_index| @board.cells[win_index]=="O"}
         @winning_board_token = "O"
        winning_flag = true
      end
    end
    return winning_flag    
  end # end of won?
  
  
  def winner #retrieves the winning boards token from the won? method
    if self.won?
      return @winning_board_token
    else
      return nil
    end
  end
  
  def turn #keeps track of the current player and makes a move if its valid
    user_input_position = self.current_player.move(@board)
      if @board.valid_move?(user_input_position) 
        @board.update(user_input_position, self.current_player)
      else 
        self.turn
      end    
    @board.display
  end
  
  def play #plays the game until its over or won or draw
    while !self.over? && !self.won? && !self.draw? do
          self.turn
    end
    if self.won?
      puts "Congratulations #{@winning_board_token}!"
    end
    if self.draw?
      puts "Cats Game!"
    end
  end
end