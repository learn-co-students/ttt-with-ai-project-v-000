require_relative '../player.rb'

class Human < Player
	
	def move(arr)
		puts "What move would you like to make?"
		move = gets.chomp
		move
	end
	
end