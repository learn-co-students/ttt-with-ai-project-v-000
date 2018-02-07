module Players
  class Human < Player

      def move(board)
        puts ">> Make a move! Please enter 1-9:"
        # display
        gets.strip
      end

      # def display
      #   puts " 1 | 2 | 3 "
      #   puts "-----------"
      #   puts " 4 | 5 | 6 "
      #   puts "-----------"
      #   puts " 7 | 8 | 9 "
      # end

    end
  end
