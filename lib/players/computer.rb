module Players

   class Computer < Player
      WINNING_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
      WINNING_PRIORITIES = [[0, 1, 2], [0, 2, 1], [1, 2, 0]]

      def winning_move(board)
         WINNING_COMBINATIONS.each do |space|
            WINNING_PRIORITIES.each do |priority|
               if (board.cells[space[priority[0]]] == self.token) && (board.cells[space[priority[1]]] == self.token)
                  next_space = space[priority[2]]
                  if !board.taken?(next_space+1)
                     return (next_space+1).to_s
                  end
               end
            end
         end
         return nil
      end

      def random_move(board)
         # get the available cells in the board
         avail = []
         board.cells.each_with_index{|b,i| avail << i+1 if b == " "}
         # #choose a random cell from the array of available cells
         test = avail.sample
         test.to_s
      end
         


      def move(board)
         sleep(1)
         winning_move(board) || random_move(board)
      end


   end



end