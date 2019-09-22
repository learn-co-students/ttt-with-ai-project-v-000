module Players
  class Computer < Player
    def move(board)#makes moves for the computer
      @the_board = board

      def empty_cells #returns an array with the position values of the empty cells
        array_of_empty_cells = []
        @the_board.cells.each_with_index do |element,index|
          if element == " "
            array_of_empty_cells << (index+1).to_s
          end
        end
        array_of_empty_cells
      end

      def opponent #returns who the opponent is as a string
        if self.token == "X"
          opponent = "O"
        elsif self.token == "O"
          opponent = "X"
        end
        opponent
      end


      def opponent_cells #returns an array with the position values of where the opponent has played
        array_of_opponent_cells = []
        @the_board.cells.each_with_index do |element,index|
          if element == opponent
            array_of_opponent_cells << (index+1).to_s
          end
        end
        array_of_opponent_cells
      end

      def test_against_winning_combos(array)#tests the board against winning combos to see if a block move is needed
        empty_cell = " "
        test_array = array.collect do |element|
          @the_board.cells[element]
        end
        if test_array.count(opponent) > 1
          array.each do |element|
            if @the_board.cells[element] == " "
              empty_cell = (element+1).to_s
            end
          end
        end
        empty_cell
      end

      #test if a defensive move (a block) is needed
      def block #return the cell that needs to be blocked if there is one
        block_cell = " "
        win_combos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

        win_combos.each do |array|
          if test_against_winning_combos(array) != " "
            block_cell = test_against_winning_combos(array)
          end
        end
          block_cell
      end

      def take_corners_strategy #take these positions: 1,3,9 : 3,7,9: 1,7,9: 1,3,7

        if block == " "
          empty_cells
          #find the first of these numbers that is not in empty_cells and return that element
          next_move = empty_cells.select do |element|
            element == "1" || element == "3"|| element == "7" || element == "9"
          end
          #return the next move
          if next_move == [] && @the_board.cells[4] == " "
            #if the strategy cells are full and the middle is empty play the middle
            next_move = "5"
          elsif next_move.size > 0
            #if next move is got stuff in the array, play the first element of the array
            next_move[0]
          else
            #if you can't play the strategy moves or the middle, play the first empty cells
            next_move = empty_cells[0]
          end
        else
          next_move = block
        end

      end
      take_corners_strategy

    end #move end
  end #class end

end #module end
