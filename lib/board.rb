class Board
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]] #defines all of the possible combinations to win
  attr_accessor :cells
  def reset! #resets the @cells which empties the board
    @cells=[" "," "," "," "," "," "," "," "," "]
  end
    
  def cells #is the board 
    @cells
  end
   
  def initialize # resets and creates a new board for a new game
    self.reset!
  end
   
  def display #displays the board currently in cells
    print " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} \n"
    print "-----------\n"
    print " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} \n"
    print "-----------\n"
    print " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
   
  def position(input) #returns the contents of the selected cell
    return @cells[input.to_i-1]
  end
   
  def full? #determines if the board is full
    !@cells.include?(" ") 
  end
   
  def turn_count #returns the amount of turns in the game
    return @cells.count {|cell| cell!=" "}
  end
   
  def taken?(input) #determines of the input cell (changed) is already taken or not
    input=input.to_i-1
    if @cells[input]!=" "
      return true
    else
      return false
    end
  end
   
  def valid_move?(input) #determines if a given number is a valid number and if the position is taken
    input.split.all? {|local_input| local_input.to_i<10 && local_input.to_i>0} #turn the input into an array so that i can compare with a number, was getting nomethod error "<" previously
    if taken?(input) #determines if the input is not taken
      return false #if the input is taken, then it is not a valid move
    else
      return true #if the input is not taken, then it could be a valid move
    end
  end
   
  def update(input, player) #updates the @cells to the token of the player
    @cells[input.to_i-1]=player.token
  end
  
  def available_moves
    available_moves_array=[]
    @cells.each_with_index do |cell,i|
      if cell ==" "
        available_moves_array << i+1
      end
                            end
    available_moves_array.join(",")
  end
  
  def introduction_board
    print " 1 | 2 | 3 \n"
    print "-----------\n"
    print " 4 | 5 | 6 \n"
    print "-----------\n"
    print " 7 | 8 | 9 "
  end
  
  def near_win 
    WIN_COMBINATIONS.each do |win_combo| #iterates over each possible win combination
      array_winners=[@cells[win_combo[0]],@cells[win_combo[1]],@cells[win_combo[2]]] #creates an array for the three cells of each possible win combination
        if array_winners.count {|winner|winner=="X"}==2 #counts to see if any two spaces in the array are filled with X
          computer_play1=win_combo[0]+1 #i used three variables and then checked for each variable if it is the one left open
          computer_play2=win_combo[1]+1
          computer_play3=win_combo[2]+1
          if valid_move?(computer_play1.to_s)
            return computer_play1.to_s
          elsif valid_move?(computer_play2.to_s)
            return computer_play2.to_s
          elsif valid_move?(computer_play3.to_s)
            return computer_play3.to_s
          end
        elsif array_winners.count {|winner|winner=="O"}==2 #the same as above with O
          computer_play1=win_combo[0]+1
          computer_play2=win_combo[1]+1
          computer_play3=win_combo[2]+1
          if valid_move?(computer_play1.to_s)
            return computer_play1.to_s
          elsif valid_move?(computer_play2.to_s)
            return computer_play2.to_s
          elsif valid_move?(computer_play3.to_s)
            return computer_play3.to_s
          end
        end
                            end
    false #the false call is for when i am calling if near_win(board) within the move method, i needed it to return something if there was no near win scenario
  end
  
  def corner_and_mid #this is responding to a certain scenario in which the board has the center position, a corner, and a non-adjacent-mid-center spots taken
    if @cells[4]!=" " #this tests if the middle spot is taken
            # X |   |   
            #-----------
            #   | O |   
            #----------- FROM THIS TO BELOW
            #   | X |    
            
            # X |   |   
            #-----------
            # O | O |   
            #-----------
            #   | X |  
      if @cells[0]!=" " && @cells[7]!=" " #this makes the computer play the open mid-center position-closest to those positions already played
        return "4"
      elsif @cells[0]!=" " && @cells[5]!=" "
        return "2"
      elsif @cells[2]!=" " && @cells[3]!=" "
        return "2"
      elsif @cells[2]!=" " && @cells[7]!=" "
        return "6"
      elsif @cells[6]!=" " && @cells[1]!=" "
        return "4"
      elsif @cells[6]!=" " && @cells[5]!=" "
        return "8"
      elsif @cells[8]!=" " && @cells[1]!=" "
        return "6"
      elsif @cells[8]!=" " && @cells[3]!=" "
        return "8"
      end
    end
        return false
  end
  
  def two_mid_adjacent
    if @cells[4]!=" "
      if @cells[1]!=" " && @cells[5]!=" "
        return "3"
      elsif @cells[1]!=" " && @cells[3]!=" "
        return "1"
      elsif @cells[3]!=" " && @cells[7]!=" "
        return "7"
      elsif @cells[5]!=" " && @cells[7]!=" "
        return "9"
      end
    end
    false
  end
  def mid_game_block # this is telling the computer that in a situation where the board looks like below
    # X |   |   
    #-----------
    # O | O | X 
    #-----------
    #   | X |    
    #to take the corner position next to an open mid-center position as follows
    # X |   | O 
    #-----------
    # O | O | X 
    #-----------
    #   | X |   
    if @cells[0]==" " && @cells[1]==" "
      return "1"
    elsif @cells[1]==" " && @cells[2]==" "
      return "3"
    elsif @cells[0]==" " && @cells[3]==" "
      return "1"
    elsif @cells[3]==" " && @cells[6]==" "
      return "7"
    elsif @cells[2]==" " && @cells[5]==" "
      return "3"
    elsif @cells[5]==" " && @cells[8]==" "
      return "9"
    elsif @cells[6]==" " && @cells[7]==" "
      return "7"
    elsif @cells[7]==" " && @cells[8]==" "
      return "9"
    end
    return false
  end
  
  def open_cells #creates the array of possible remaining moves
    available_moves.split(",").sample
  end
end