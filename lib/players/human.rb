module Players
  class Human < Player
    def move(board)
    	puts "#{token}, Pick a number between 1-9"
    	gets.strip
    end
  end
end
