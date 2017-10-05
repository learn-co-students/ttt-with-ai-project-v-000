module Players
  class Human < Player

  	def move(board)
  		puts "Please enter a cell:"
  		input = gets.strip
  	end
  		
  end
end