module Players
	class Human < Player
		
		def move (array = [])
			puts "#{@name} enter your move 1-9"
			input = gets.strip
			
		end
	end
end