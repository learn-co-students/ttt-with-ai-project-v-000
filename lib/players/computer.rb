module Players
   class Computer < Player
      def move(board)
         move = ''

         if board.turn_count == 0
            move = '1'
         elsif board.turn_count == 1
            if board.valid_move?(5)
               move = '5'
            elsif board.valid_move?(1)
               move = '1'
            elsif board.valid_move?(9)
               move = '9'
            elsif board.valid_move?(3)
               move = '3'
            elsif board.valid_move?(7)
               move = '7'
            end
         elsif board.turn_count == 2
            if board.valid_move?(1)
               move = '1'
            elsif board.valid_move?(9)
               move = '3'
            elsif board.valid_move?(3)
               move = '7'
            elsif board.valid_move?(7)
               move = '9'
            end
         else

            if vertical?(board) != 0
               move = vertical?(board)
            elsif horizontal?(board) != 0
               move = horizontal?(board)
            elsif diagonal?(board) != 0
               move = diagonal?(board)
            elsif vertical?(board) == 0 && horizontal?(board) == 0 && diagonal?(board) == 0
               move = first_available(board)
            end
         end
         move
      end

      def first_available(board)
         move = 0
         move = if board.valid_move?(1)
                   1
                elsif board.valid_move?(2)
                   2
                elsif board.valid_move?(3)
                   3
                elsif board.valid_move?(4)
                   4
                elsif board.valid_move?(5)
                   5
                elsif board.valid_move?(6)
                   6
                elsif board.valid_move?(7)
                   7
                elsif board.valid_move?(8)
                   8
                else
                   9
                end
         move
      end

      def vertical?(board)
         move = 0
         if board.taken?(1) && board.cells[0] == board.cells[3] && board.valid_move?(7)
            move = '7'
         elsif board.taken?(2) && board.cells[1] == board.cells[4] && board.valid_move?(8)
            move = '8'
         elsif board.taken?(3) && board.cells[2] == board.cells[5] && board.valid_move?(9)
            move = '9'
         elsif board.taken?(7) && board.cells[6] == board.cells[3] && board.valid_move?(1)
            move = '1'
         elsif board.taken?(8) && board.cells[7] == board.cells[4] && board.valid_move?(2)
            move = '2'
         elsif board.taken?(9) && board.cells[8] == board.cells[5] && board.valid_move?(3)
            move = '3'
         elsif board.taken?(7) && board.cells[6] == board.cells[0] && board.valid_move?(4)
            move = '4'
         elsif board.taken?(8) && board.cells[7] == board.cells[1] && board.valid_move?(5)
            move = '5'
         elsif board.taken?(9) && board.cells[8] == board.cells[2] && board.valid_move?(6)
            move = '6'
         end
         move
      end

      def horizontal?(board)
         move = 0
         if board.taken?(1) && board.cells[0] == board.cells[1] && board.valid_move?(3)
            move = '3'
         elsif board.taken?(4) && board.cells[3] == board.cells[4] && board.valid_move?(6)
            move = '6'
         elsif board.taken?(7) && board.cells[6] == board.cells[7] && board.valid_move?(9)
            move = '9'
         elsif board.taken?(3) && board.cells[2] == board.cells[1] && board.valid_move?(1)
            move = '1'
         elsif board.taken?(5) && board.cells[5] == board.cells[4] && board.valid_move?(4)
            move = '4'
         elsif board.taken?(9) && board.cells[8] == board.cells[7] && board.valid_move?(7)
            move = '7'
         elsif board.taken?(9) && board.cells[8] == board.cells[6] && board.valid_move?(8)
            move = '8'
         elsif board.taken?(6) && board.cells[5] == board.cells[3] && board.valid_move?(5)
            move = '5'
         elsif board.taken?(3) && board.cells[2] == board.cells[0] && board.valid_move?(2)
            move = '2'
         end
         move
      end

      def diagonal?(board)
         move = 0
         if board.taken?(1) && board.cells[0] == board.cells[4] && board.valid_move?(9)
            move = '9'
         elsif board.taken?(3) && board.cells[2] == board.cells[4] && board.valid_move?(7)
            move = '7'
         elsif board.taken?(9) && board.cells[8] == board.cells[4] && board.valid_move?(1)
            move = '1'
         elsif board.taken?(7) && board.cells[6] == board.cells[4] && board.valid_move?(3)
            move = '3'
         end
         move
      end
  end
end
