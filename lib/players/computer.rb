module Players
  class Computer < Player
    # Players::Computer inherits from Player
    # Players::Computer #move returns a valid position for the computer to move
    def move(board, game = Game.new)
      #move method that accepts a board and returns the move
      #the computer wants to make in the form of a 1-9 string.
      #what kind of strategies I might use
      if board.cells[4] == " "
        "5"
      elsif board.cells[8] == " "
        "9"
      elsif board.cells[0] == " "
        "1"
      elsif board.cells[6] == " "
        "7"
      elsif board.cells[2] == " "
        "3"
      elsif board.cells[1] == " "
        "2"
      elsif board.cells[7] == " "
        "8"
      elsif board.cells[3] == " "
        "4"
      elsif board.cells[5] == " "
        "6"
      end
    end
  end
end
