module Players
  class Computer < Player
    def move(board)
      move = ""

      #Take center if open
      if !board.taken?(5)
        move = "5"

      #If center is taken, take upper left corner or upper right corner (whichever open)
      elsif board.taken?(5) && !board.taken?(1)
        move = "1"

      #.. or upper right corner
      elsif board.taken?(5) && !board.taken?(3)
        move = "3"

      #If diagonal win is possible, take it!
      elsif board.taken?(1) == board.taken?(5) && !board.taken?(8)
        move = "8"

      #Or the other possibility...
      elsif board.taken?(3) == board.taken?(5) && !board.taken?(6)
        move = "6"

      #Block Player 1's win possibilities (if player 1 got center square)
      elsif board.position(1) == board.position(5) && !board.taken(9)
        move = "9"

      elsif board.position(2) == board.position(5) && !board.taken(8)
        move = "8"

      elsif board.position(3) == board.position(5) && !board.taken(7)
          move = "7"

      elsif board.position(4) == board.position(5) && !board.taken(6)
          move = "6"

      elsif board.position(6) == board.position(5) && !board.taken(4)
          move = "4"

      elsif board.position(7) == board.position(5) && !board.taken(3)
          move = "3"

      elsif board.position(8) == board.position(5) && !board.taken(2)
          move = "2"

      elsif board.position(9) == board.position(5) && !board.taken(1)
          move = "1"

      #Take any open square
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|i| !board.taken?(i) }
      end
      move
    end
  end
end
