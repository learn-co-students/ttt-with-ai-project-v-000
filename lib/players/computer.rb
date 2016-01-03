require_relative "../player.rb" #the computer ai is controlled by how many open spaces are left, and what the computer should decide on, if nothing else, the computer chooses a random open square
require 'pry'
class Computer < Player
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[1,4,7],[0,3,6],[2,5,8]] #the WINCOMBINATIONS CONSTANT
    
    def move (board) 
   puts "   #{@name}, What is your next move?" #not necessary, but fun to print the computers name
   puts "                                 " 
    empty_cell_count = board.cells.count {|cell|cell==" "} #counting the empty cells 
    if empty_cell_count==9 #the inital move if the computer has the first move, i am worried that these first few moves are hardcoded, there could, and may well be a failur of logic
        return ["1","3","7","9"].sample #randomly returns one of the corner moves
    elsif empty_cell_count==8 #if the computer is second to go, and the center square is available, it goes in the center, otherwise it takes a corner square
        if board.cells[4]==" "
            return "5"
        else
            return ["1","3","7","9"].sample
        end
    elsif near_win(board) #checks for a near win scenario for themselves and the other side, if there is a near win scenario, it plays the last place to either win or block
        return near_win(board)
    elsif empty_cell_count==6
        if board.cells[0]!=" " && board.cells[8]!=" " 
            return ["2","4","6","8"].sample
        elsif board.cells[2]!=" " && board.cells[6]!=" "
            return ["2","4","6","8"].sample
        elsif corner_and_mid(board)
            return corner_and_mid(board)
        end
    elsif empty_cell_count==4
        if mid_game_block(board)
            return mid_game_block(board)
        end
    end
    
    open_cells(board) #if no near win scenario is available, it randomly calls one of the remaining squares
    end
    
    def corner_and_mid(board) #this is responding to a certain scenario in which the board has the center position, a corner, and a non-adjacent-mid-center spots taken
        if board.cells[4]!=" " #this tests if the middle spot is taken
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
            if board.cells[0]!=" " && board.cells[7]!=" " #this makes the computer play the open mid-center position-closest to those positions already played
                return "4"
            elsif board.cells[0]!=" " && board.cells[5]!=" "
                return "2"
            elsif board.cells[2]!=" " && board.cells[3]!=" "
                return "2"
            elsif board.cells[2]!=" " && board.cells[7]!=" "
                return "6"
            elsif board.cells[6]!=" " && board.cells[1]!=" "
                return "4"
            elsif board.cells[6]!=" " && board.cells[5]!=" "
                return "8"
            elsif board.cells[8]!=" " && board.cells[1]!=" "
                return "6"
            elsif board.cells[8]!=" " && board.cells[3]!=" "
                return "8"
            end
        end
        return false
    end
    
    def mid_game_block(board) # this is telling the computer that in a situation where the board looks like below
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
        if board.cells[0]==" " && board.cells[1]==" "
            return "1"
        elsif board.cells[1]==" " && board.cells[2]==" "
            return "3"
         elsif board.cells[0]==" " && board.cells[3]==" "
            return "1"
         elsif board.cells[3]==" " && board.cells[6]==" "
            return "7"
         elsif board.cells[2]==" " && board.cells[5]==" "
            return "3"
         elsif board.cells[5]==" " && board.cells[8]==" "
            return "9"
         elsif board.cells[6]==" " && board.cells[7]==" "
            return "7"
         elsif board.cells[7]==" " && board.cells[8]==" "
            return "9"
        end
        return false
    end
    
    
    def near_win (board)
        WIN_COMBINATIONS.each do |win_combo| #iterates over each possible win combination
        array_winners=[board.cells[win_combo[0]],board.cells[win_combo[1]],board.cells[win_combo[2]]] #creates an array for the three cells of each possible win combination
        if array_winners.count {|winner|winner=="X"}==2 #counts to see if any two spaces in the array are filled with X
            computer_play1=win_combo[0]+1 #i used three variables and then checked for each variable if it is the one left open
            computer_play2=win_combo[1]+1
            computer_play3=win_combo[2]+1
            if board.valid_move?(computer_play1.to_s)
                return computer_play1.to_s
            elsif board.valid_move?(computer_play2.to_s)
                return computer_play2.to_s
            elsif board.valid_move?(computer_play3.to_s)
                return computer_play3.to_s
            end
        elsif array_winners.count {|winner|winner=="O"}==2 #the same as above with O
            computer_play1=win_combo[0]+1
            computer_play2=win_combo[1]+1
            computer_play3=win_combo[2]+1
            if board.valid_move?(computer_play1.to_s)
                return computer_play1.to_s
            elsif board.valid_move?(computer_play2.to_s)
                return computer_play2.to_s
            elsif board.valid_move?(computer_play3.to_s)
                return computer_play3.to_s
            end
        end
                        end
        return false #the false call is for when i am calling if near_win(board) within the move method, i needed it to return something if there was no near win scenario
    end
    
    def open_cells (board) #creates the array of possible remaining moves
     open_cells_array=[] 
     board.cells.each_with_index do |cell,i| #used the index 
        if cell==" "
            i=i+1 #adds, because the move call still utilizes the "human" numbers and so every number needs to be increased
            i=i.to_s #makes the changed index a string 
            open_cells_array << i
        end
                                end
                                
      return open_cells_array.sample #returns a random number from the array
    end
end

