module Players
  class Computer < Player
  	def move(board)
  		if !board.taken?("5")
  			return "5"
  		elsif !board.taken?("1")
  			return "1"
  		elsif !board.taken?("9")
  			return "9"
  		elsif !board.taken?("7")
  			return "7"
  		elsif !board.taken?("3")
  			return "3"
  		elsif !board.taken?("2")
  			return "2"
  		elsif !board.taken?("4")
  			return "4"
  		elsif !board.taken?("6")
  			return "6"
  		elsif !board.taken?("8")
  			return "8"
  		end
  	end
  end
end