module Players
	class Human < Player
	
		def move(board)
			#get players move from CLI
			puts "Your move #{self.token}"
			puts "Please enter your move between 1-9"
			position = gets.strip
			position.to_s
		end
		
	end
end
