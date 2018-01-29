module Players
   class Human < Player
      def move(_board)
         gets.chomp
      end
   end
end
