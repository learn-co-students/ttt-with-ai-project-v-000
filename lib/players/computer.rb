module Players
  class Computer < Player

    def move(board) #accepts a board and returns the move the computer wants to make in the form of a 1-9 string
      input = Random.rand(1..9).to_s # Computer picks a number (0-8).random
    end
  end
end
