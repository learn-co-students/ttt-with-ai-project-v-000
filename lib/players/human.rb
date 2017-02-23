require_relative "../../config/environment.rb"

module Players
	class Human < Player
		def move(board)
			puts "Enter your move #{token}: "
			move_input = gets.chomp
			puts "\n\n\n\n\n"
			move_input
		end
	end
end
