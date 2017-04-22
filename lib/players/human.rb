#   ~~~HAVICK WAS HERE~~~

module Players
	class Human < Player
def move(board)
	board.display
	puts "Where would you like to move?"
	gets.strip

	  end
	end
end
