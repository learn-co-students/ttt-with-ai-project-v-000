module Players

    class Human < Player

      def move(user_input)
        puts "Please enter 1 through 9 for your move."
        user_input = gets.strip
        user_input
      end

  end
end
