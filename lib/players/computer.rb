require 'pry'
module Players
  class Computer < Player
      def move(board)
        puts "This is turn #{board.turn_count}"

        case board.turn_count
          when 0
            "3"
          when 1
            board.cells[4] == " " ? "5" : (board.cells.index{|p| p == " "} + 1).to_s
          when 2
            #if second player plays the middle, play the opposite corner or a non-adjacent middle edge
            (board.cells.index{|p| p == " "} + 1).to_s
          when 3
            (board.cells.index{|p| p == " "} + 1).to_s
          when 4
            (board.cells.index{|p| p == " "} + 1).to_s
          when 5
            (board.cells.index{|p| p == " "} + 1).to_s
          when 6
            (board.cells.index{|p| p == " "} + 1).to_s
          when 7
            (board.cells.index{|p| p == " "} + 1).to_s
          when 8
            (board.cells.index{|p| p == " "} + 1).to_s
          when 9
            (board.cells.index{|p| p == " "} + 1).to_s
        end

        #if board.turn_count == 0
      #    "3"
      #  elsif board.turn_count == 1 || board.turn_count == 2
      #    attempt = 1
      #    if attempt == 1
      #      "5"
      #      attempt += 1
      #    else
      #       (board.cells.index{|p| p == " "} + 1).to_s
      #    end
      #  else
      #    (board.cells.index{|p| p == " "} + 1).to_s
      #  end
      end
  end
end
