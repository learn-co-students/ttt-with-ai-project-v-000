module Players
  class Computer < Player

      def move(token)
        puts "Please enter a number 1 - 9"
        ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
      end

  end
end
