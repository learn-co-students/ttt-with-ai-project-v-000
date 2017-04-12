module Players
  class Computer < Player

    def move(board)
      move = nil

      #if going first take mid
      if board.cells[4] == " "
        move = "5"
        #if going second and they took mid, take top left
      elsif board.turn_count == 1
        move = "1"

        #check the rest of the corners for a good move (turn 3)
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|i| !board.taken?(i)}.to_s

        #if went second and took middle, and other player has corners and will win, stop that
      elsif board.turn_count == 3 && (board.position(1) == board.position(3))
        move = "2"

      elsif board.turn_count == 3 && (board.position(3) == board.position(9))
        move = "6"

      elsif board.turn_count == 3 && (board.position(7) == board.position(9))
        move = "8"

      elsif board.turn_count == 3 && (board.position(1) == board.position(7))
        move = "4"

        


      end

    end
  end
end
