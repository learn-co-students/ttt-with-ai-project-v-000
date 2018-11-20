module Players
  class Computer < Player

  #Try sides
  #Try corners

    def move(board)
      move = " "
      #When going first, fill middle cell. When going second, fill middle cell if not taken.
      if !board.taken?(5)
        move = "5"
      #When going second, take the upper left cell if middle is taken.
      elsif board.turn_count ==  1
        move = "1"
      #
      end
    end
  end
end
