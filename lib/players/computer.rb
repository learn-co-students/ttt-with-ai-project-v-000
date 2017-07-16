module Players
  class Computer < Player

    def move(board)
      #returns the move the computer wants to make as 1-9 string
      position = rand(1..9).to_s
      #i get to determine the logic!
      #strive to build unbeatable logic
      #ldook into min/max algorithm

    end

  end
end
