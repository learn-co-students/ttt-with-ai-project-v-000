require 'pry'
module Players
  class Computer < Player
    def move(board)
      if !board.taken?("5")
        "5"
      else
        choices(board)
      end
    end



      def winning_combination(board)
        #if board contains part of a winning combination (2 out of 3 positions)
        if Game::WIN_COMBINATIONS.each do |win|
          if board.cells[win[0]] == board.cells[win[1]]
            if !board.taken?(win[2])
              return win[2].to_s
            end
          elsif board.cells[win[1]] == board.cells[win[2]]
            if !board.taken?(win[0])
              return win[0].to_s
            end
          elsif board.cells[win[0]] == board.cells[win[2]]
            if !board.taken?(win[1])
              return win[1].to_s
            end

          end
        end
      end
        #check if missing part of the winning combination is taken.
      end


      def corners(board)
        # corner = ["1", "3", "7", "9"]
        corner = [1, 3, 7, 9]
        corner = corner.sample(4)
        corner.detect do |c|
          if !board.taken?(c)
            return c

          end
        end
      end

      def middles(board)
        # middle = ["2", "4", "6", "8"]
        middle = [2, 4, 6, 8]
        middle = middle.sample(4)
        middle.each do |m|
          if !board.taken?(m)
            return m
          end
        end
      end

      def choices(board)
          corners(board) || middles(board)
            # winning_combination(board) ||

      end


  end
end
