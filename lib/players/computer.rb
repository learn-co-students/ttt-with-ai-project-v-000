module Players
  class Computer < Player

    def random_num
      position = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end

      def move(board)
        puts "Computer is making a move..."
        if board.turn_count <= 4
          [0, 2, 6, 8].each { |x| return x + 1 if board.cells[x] == " " }
        else
          n = random_num #pick a random number
          if board.valid_move?(n) #check that it is a valid move (position)
          n #return the valid position
        end
      end
    end



          ##RANDOM NUMBER
      #   n = random_num #pick a random number
      #   if board.valid_move?(n) #check that it is a valid move (position)
      #      n #return the valid position
      #    else
      #      random_num
      #   end
      # end

    end
  end



  ## AI NOTES

  # 1. after HU goes first, go into corner, otherwise if first go into a corner
  # 2. if CO went first, go into another corner. Otherwise check winning combo
  # 3. Continue to check winning combos to block
