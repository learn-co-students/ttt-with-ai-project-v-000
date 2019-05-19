module Players
  class Human < Player

    def move(board)
    	puts "Enter your move: "
    	gets.chomp
    end

  end
end