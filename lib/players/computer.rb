module Players
  class Computer < Player

    def random_num
      position = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end

      def move(board)
        puts "Computer is making a move..."
        n = random_num #pick a random number
        if board.valid_move?(n) #check that it is a valid move (position)
           n #return the valid position
         else
           random_num
        end
      end

    end
  end
