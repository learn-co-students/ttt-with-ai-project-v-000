class Player::Computer < Player
  attr_reader :token, :board
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
  def move(board) 
    my_move = self.next_move(board)
    return my_move
  end
  
  def next_move(board)  
    #determines opponent's token
    if self.token == "X"
      opp_token = "O"
    else
      opp_token = "X"
    end
    
    #checks if computer is going to win
    WIN_COMBINATIONS.each do |win_combination|
      if (board.cells[win_combination[0]] == " " || board.cells[win_combination[1]] == " " || board.cells[win_combination[2]] == " ")
        opp_count = 0 # opponent move count
        my_count = 0 # my move count
        win_combination.each do |win_index|
          if board.cells[win_index] == opp_token
            opp_count +=1
          elsif board.cells[win_index] == self.token
            my_count +=1
          end
        end
        if my_count > 1
          if board.cells[win_combination[0]] == " "
            return win_combination[0]+1
          elsif board.cells[win_combination[1]] == " "
            return win_combination[1]+1
          else
            return win_combination[2]+1        
          end
        end
        
      end
    end
    #checks if opponent is going to win
     WIN_COMBINATIONS.each do |win_combination|
      if (board.cells[win_combination[0]] == " " || board.cells[win_combination[1]] == " " || board.cells[win_combination[2]] == " ")
        opp_count = 0 # opponent move count
        my_count = 0 # my move count
        win_combination.each do |win_index|
          if board.cells[win_index] == opp_token
            opp_count +=1
          elsif board.cells[win_index] == self.token
            my_count +=1
          end
        end
        if opp_count > 1
          if board.cells[win_combination[0]] == " "
            return win_combination[0]+1
          elsif board.cells[win_combination[1]] == " "
            return win_combination[1]+1
          else
            return win_combination[2]+1       
          end
        end
        
      end
    end
    #returns random number if board is nearly blank
    return rand(9).to_s
  end #end of next_move
  
end
