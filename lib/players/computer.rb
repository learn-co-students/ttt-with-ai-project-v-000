module Players
  class Computer < Player
    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
    def corner_move(board)
      input = [1,3,7,9].sample.to_s
      if board.valid_move?(input)
        input
      else
        corner_move(board)
      end
    end
    def opposite_corner(board)
     if board.position(1) == self.token
       if !board.taken?(9)
         "9"
       elsif board.position(9) != self.token && board.taken?(9)
         ["7","3"].sample
       end
     elsif board.position(3) == self.token
       if !board.taken?(7)
         "7"
       elsif board.position(7) != self.token && board.taken?(7)
         ["1","9"].sample
       end
     elsif board.position(7) == self.token
       if !board.taken?(3)
         "3"
       elsif board.position(3) != self.token && board.taken?(3)
         ["7","3"].sample
       end
     elsif board.position(9) == self.token
       if !board.taken?(1)
         "1"
       elsif board.position(1) != self.token && board.taken?(1)
         ["1","9"].sample
       end
     end
     end
     def center_move(board)
       if !board.taken?(5)
         "5"
       end
     end
     def edge_move(board)
       input = ["2","4","6","8"].sample
       if board.valid_move?(input)
         input
       else
         edge_move(board)
       end
     end
     def win_move(board)
       win_1 = WIN_COMBINATIONS.detect do |combo|
      		       input_1 = combo[0]
      		       input_2 = combo[1]
      		       input_3 = combo[2]
      		       board.cells[input_1] == self.token && board.cells[input_2] == self.token && board.cells[input_3] == " "
    	        end
       win_2 = WIN_COMBINATIONS.detect do |combo|
    			       input_1 = combo[0]
    			       input_2 = combo[1]
    			       input_3 = combo[2]
    			       board.cells[input_2] == self.token && board.cells[input_3] == self.token && board.cells[input_1] == " "
    	        end
     	win_3 = WIN_COMBINATIONS.detect do |combo|
             	 input_1 = combo[0]
             	 input_2 = combo[1]
             	 input_3 = combo[2]
             	 board.cells[input_1] == self.token && board.cells[input_3] == self.token && board.cells[input_2] == " "
             	end
         if win_1
              (win_1.detect{|i| board.cells[i]==" "}+1).to_s
         elsif win_2
         	    (win_2.detect{|i| board.cells[i]==" "}+1).to_s
         elsif win_3
         	    (win_3.detect{|i| board.cells[i]==" "}+1).to_s
         end
      end
      def defend(board)
        defend_1 = WIN_COMBINATIONS.detect do |combo|
                  input_1 = combo[0]
                  input_2 = combo[1]
                  input_3 = combo[2]
                  board.cells[input_1] != self.token && board.cells[input_1] != " " && board.cells[input_2] != self.token && board.cells[input_2] != " " && board.cells[input_3] == " "
               end
        defend_2 = WIN_COMBINATIONS.detect do |combo|
                  input_1 = combo[0]
                  input_2 = combo[1]
                  input_3 = combo[2]
                  board.cells[input_2] != self.token && board.cells[input_2] != " " && board.cells[input_3] != self.token && board.cells[input_3] != " " && board.cells[input_1] == " "
               end
       defend_3 = WIN_COMBINATIONS.detect do |combo|
                input_1 = combo[0]
                input_2 = combo[1]
                input_3 = combo[2]
                board.cells[input_1] != self.token && board.cells[input_1] != " " && board.cells[input_3] != self.token && board.cells[input_3] != " " && board.cells[input_2] == " "
               end
          if defend_1
            (defend_1.detect{|i| board.cells[i]==" "}+1).to_s
          elsif defend_2
            (defend_2.detect{|i| board.cells[i]==" "}+1).to_s
          elsif defend_3
            (defend_3.detect{|i| board.cells[i]==" "}+1).to_s
          end
       end
       def valid_move(board)
         valid_moves = []
         board.cells.map.with_index(1) do |v, i|
            if v == " "
              valid_moves << i.to_s
            end
          end
          valid_moves.sample
       end
      def move(board)
          if board.turn_count == 0
            corner_move(board)
          elsif board.turn_count == 1
            sleep(1)
              if !board.taken?("5")
                center_move(board)
              else
                corner_move(board)
              end
          elsif board.turn_count == 2
            opposite_corner(board)
          elsif board.turn_count == 3
            sleep(1)
            defend(board) || edge_move(board)
          else
            sleep(1)
            win_move(board) || defend(board) || valid_move(board)
          # elsif board.turn_count == 5
          #   sleep(1)
          #   win_move(board) || defend(board) || valid_move(board)
          # else
          #   sleep(1)
          #   win_move(board) || defend(board) || valid_move(board)
          end
        end
    end
end
