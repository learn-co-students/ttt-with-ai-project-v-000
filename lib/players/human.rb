module Players
  class Human < Player
		def move(arg)
			print "Select a number between 1 - 9, asshole.😊"
			input = gets.strip
		end
	end
end
