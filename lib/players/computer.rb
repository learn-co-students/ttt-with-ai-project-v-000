require 'pry'
module Players
  class Computer < Player
    WINS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
    
    def move(board=nil)
      
      count = 0
      my_move = ""
      
      # Working logic so far: Takes middle square first, if possible, takes corner squares next if possible.
      
      # Not working yet: exiting each loop once the matching if/elsifs are found and blocking successfully
      
      WINS.each do |combo|

        if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " "
          puts "Match 1/2"
          if board.cells[combo[2]] == " "
            my_move =  (combo[2] + 1).to_s
          end
          
          
        elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
          puts "Match 1/3"
          if board.cells[combo[1]] == " "
            my_move = (combo[1] + 1).to_s
          end

          
        elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != " "
          if board.cells[combo[0]] == " "
            my_move = (combo[0] + 1).to_s
          end

          
        elsif board.turn_count == 0
          puts "1st turn"
          my_move = "5"

          
        elsif board.turn_count == 1 || board.turn_count == 2
          puts "2nd or third turn"
          my_move = ["1", "3", "5", "7"].sample
 
          
        else
          "Other"
          my_move = rand(1..9).to_s
        end
      end
      my_move
    end
  end
end

# How to play TTT logically
# 1. First - scan the board, looking for two matching tokens in a line
# 2. Second - if I see two matching tokens, is there an empty spot in third spot? If so, go there.
# 3. Third - if there are not two matching tokens in a line, is the center spot taken?
# 4. Forth - if there are not matching tokens, and the center is taken, are the corners taken?
# 5. Fifth - 

# WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], # [6,4,2]]
