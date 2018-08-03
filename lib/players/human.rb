module Players

    class Human < Player

      def move(user_input)
        user_input = ""
        user_input = gets.strip
        user_input
      end
  
  end
end
