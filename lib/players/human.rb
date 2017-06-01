module Players
  class Human < Player

  	def move(board)
  		puts "What is your move, #{self.token}?"
  		input = gets.chomp
  	end

  end
end