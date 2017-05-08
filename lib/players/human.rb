module Players
	class Human < Player
		def move(input)
			puts "Where do you want to move?"
			input = gets.chomp
		end
	end	
end