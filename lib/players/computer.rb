require 'pry'
module Players
  class Computer < Player

    attr_accessor :token, :board

    def initialize(token)
      @token = token
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
      [6,4,2]
      ]

    def board_combinations_with_index(board)
       WIN_COMBINATIONS.map {|combo|
       combo.map {|x| [board.cells[x], (x).to_i.+(1).to_s]}} 
        ##  board_combinations_with_index(board) = [
        ##  [["X", "1"], ["O", "2"], [" ", "3"]], 
        ##  [[" ", "4"], ["X", "5"], [" ", "6"]], 
        ##  [[" ", "7"], [" ", "8"], [" ", "9"]], 
        ##  [["X", "1"], [" ", "4"], [" ", "7"]], 
        ##  [["O", "2"], ["X", "5"], [" ", "8"]], 
        ##  [[" ", "3"], [" ", "6"], [" ", "9"]], 
        ##  [["X", "1"], ["X", "5"], [" ", "9"]], 
        ##  [[" ", "7"], ["X", "5"], [" ", "3"]]
        ##] 
      end

    def board_win_detected(board)
      board_combinations_with_index(board).detect {|cmb| 
      ((cmb[0][0] == self.token) && (cmb[1][0] == self.token) && (cmb[2][0] == " ")) ||
      ((cmb[0][0] == self.token) && (cmb[1][0] == " ") && (cmb[2][0] == self.token)) ||
      ((cmb[0][0] == " ") && (cmb[1][0] == self.token) && (cmb[2][0] == self.token))
       } 
    end

    def board_block_detected(board)
      my_token = self.token
      if self.token = "O"
        opp_token = "X"
      else
        self.token = "X"
        opp_token = "O"
      end
      board_combinations_with_index(board).detect {|cmb|
      ((cmb[0][0] == opp_token) && (cmb[1][0] == opp_token) && (cmb[2][0] == " ")) ||
      ((cmb[0][0] == opp_token) && (cmb[1][0] == " ") && (cmb[2][0] == opp_token)) ||
      ((cmb[0][0] == " ") && (cmb[1][0] == opp_token) && (cmb[2][0] == opp_token))
       }  
   #   ((cmb[0][0] == !self.token && cmb[0][0] != " ") && (cmb[1][0] != self.token && cmb[1][0] != " ") && (cmb[2][0] == " ")) ||
   #   ((cmb[0][0] == !self.token && cmb[0][0] != " ") && (cmb[1][0] != " ") && (cmb[2][0] != self.token && cmb[2][0] != " ")) ||
   #   ((cmb[0][0] == " ") && (cmb[1][0] != self.token && cmb[1][0] != " ") && (cmb[2][0] != self.token && cmb[2][0] != " "))
   #   }
    end
    
    def move(board)
      #Takes the middle square if available
      if board.valid_move?("5")
        move = "5"
      #Takes Top left square if middle square is taken
      elsif board.turn_count == 1
        move = "1"
      #Takes a random corner in all other situations
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].shuffle.detect{|i| !board.taken?(i)}.to_s
      else
        
        if !board_win_detected(board).nil? 
          board_win_detected(board).select {|x| 
            if x[0] == " "
              move = x[1].to_s
            end
            }
        elsif !board_block_detected(board).nil?
          board_block_detected(board).select {|x| 
            if x[0] == " "
              move = x[1].to_s
            end
            }
        else
          moves = [1, 3, 7, 9, 2, 4, 6, 8].select {|i| !board.taken?(i)}.sample
          move = moves.to_s
            
        end
        #binding.pry
      end
        move

    end        

        #elsif board_combinations_with_index(board).detect {|cmb| 
        #  (cmb[0][0] != (self.token || " ") && cmb[1][0] != (self.token || " ") && cmb[2][0] == " ") ||
        #  (cmb[0][0] != (self.token || " ") && cmb[1][0] != " " && cmb[2][0] != (self.token || " ")) ||
        #  (cmb[0][0] == " " && cmb[1][0] != (self.token || " ") && cmb[2][0] != (self.token || " "))}.select {|x| 
        #    if x[0] == " "
        #      move = x[1].to_s
        #    end
        #    }
        #  end
 
    
      
  end
end
