module Players

    class Human < Player

      def move(position)
        puts "\nPlease enter a valid move: 1-9"
        position = gets.strip
        position
      end

    end

     class Computer < Player
     end

  end
