module Players

  class Human < Player
      def move(board)
        	puts "Enter Position: "
  	      gets.strip
      end
  end

end
