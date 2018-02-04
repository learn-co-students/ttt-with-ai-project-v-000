module Players
  class Computer < Player

    def move(board)
    #Top row, prevent win
      if board.cells[0] != self.token && board.cells[0] != " " && board.cells[1] != self.token && board.cells[1] != " "
          "2"
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[2] != self.token && board.cells[2] != " "
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[2] != self.token && board.cells[2] != " "
          "1"
    #Middle row, prevent win
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[4] != self.token && board.cells[4] != " "
          "5"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[5] != self.token && board.cells[5] != " "
          "3"
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[5] != self.token && board.cells[5] != " "
          "4"
    #Bottom row, prevent win
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[7] != self.token && board.cells[7] != " "
          "8"
      elsif board.cells[7] != self.token && board.cells[7] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "6"
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "7"
    #Kitty corner right to left, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[4] != self.token && board.cells[4] != " "
          "8"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "4"
    #Kitty corner left to right, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[4] != self.token && board.cells[4] != " "
          "6"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[6] != self.token && board.cells[6] != " "
          "2"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[6] != self.token && board.cells[6] != " "
          "4"
      #Left column, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[3] != self.token && board.cells[3] != " "
          "6"
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[6] != self.token && board.cells[6] != " "
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[6] != self.token && board.cells[6] != " "
          "3"
      #Middle column, prevent win
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[4] != self.token && board.cells[4] != " "
          "7"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[7] != self.token && board.cells[7] != " "
          "1"
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[7] != self.token && board.cells[7] != " "
          "4"
      #Right column, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[5] != self.token && board.cells[5] != " "
          "8"
      elsif board.cells[5] != self.token && board.cells[5] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "2"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[8] != self.token && board.cells[8] != " "
          "5"
      elsif board.valid_move?("4")
         "4"
      elsif board.valid_move?("0")
         "0"
      elsif board.valid_move?("2")
         "2"
      elsif board.valid_move?("6")
         "6"
      elsif board.valid_move?("8")
         "8"
      elsif board.valid_move?("1")
         "1"
      elsif board.valid_move?("3")
         "3"
      elsif board.valid_move?("5")
         "5"
      elsif board.valid_move?("7")
         "7"

      end
    end

  end

end
