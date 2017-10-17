module Players

  class Computer < Player

    # attr_accessor :board

    #A few things to remember here: computer needs to return a string do to the way that Game#turn works.
    #Because you are guaranteed that the computer's move will be between 1 and 9, you only need to check if the space is open.
    def move(board)
      position = rand(1..9)
      if board.cells[position - 1] == " "
        puts "Computer chose #{position}."
  	 		position.to_s
  	 	else
  	 		move(board)
  	 	end
    end

  end

end
