module Players
  class Computer < Player

    def move(board)
    #Top row, prevent win
      if board.cells[0] != self.token && board.cells[0] != " " && board.cells[1] != self.token && board.cells[1] != " "
        puts "#{self.token} plays in space 3"
          "2"
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[2] != self.token && board.cells[2] != " "
        puts "#{self.token} plays in space 1"
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[2] != self.token && board.cells[2] != " "
        puts "#{self.token} plays in space 2"
          "1"
    #Middle row, prevent win
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[4] != self.token && board.cells[4] != " "
        puts "#{self.token} plays in space 6"
          "5"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[5] != self.token && board.cells[5] != " "
        puts "#{self.token} plays in space 4"
          "3"
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[5] != self.token && board.cells[5] != " "
          puts "#{self.token} plays in space 5"
          "4"
    #Bottom row, prevent win
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[7] != self.token && board.cells[7] != " "
          puts "#{self.token} plays in space 9"
          "8"
      elsif board.cells[7] != self.token && board.cells[7] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 7"
          "6"
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 8"
          "7"
    #Kitty corner right to left, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[4] != self.token && board.cells[4] != " "
          puts "#{self.token} plays in space 9"
          "8"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 1"
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 5"
          "4"
    #Kitty corner left to right, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[4] != self.token && board.cells[4] != " "
          puts "#{self.token} plays in space 7"
          "6"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 3"
          "2"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 5"
          "4"
      #Left column, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[3] != self.token && board.cells[3] != " "
          puts "#{self.token} plays in space 7"
          "6"
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 1"
          "0"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 4"
          "3"
      #Middle column, prevent win
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[4] != self.token && board.cells[4] != " "
          puts "#{self.token} plays in space 8"
          "7"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[7] != self.token && board.cells[7] != " "
          puts "#{self.token} plays in space 2"
          "1"
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[7] != self.token && board.cells[7] != " "
          puts "#{self.token} plays in space 5"
          "4"
      #Right column, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[5] != self.token && board.cells[5] != " "
          puts "#{self.token} plays in space 9"
          "8"
      elsif board.cells[5] != self.token && board.cells[5] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 3"
          "2"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 6"
          "5"
      elsif board.valid_move?("4")
          puts "#{self.token} plays in space 5"
         "4"
      elsif board.valid_move?("0")
          puts "#{self.token} plays in space 1"
         "0"
      elsif board.valid_move?("2")
          puts "#{self.token} plays in space 3"
         "2"
      elsif board.valid_move?("6")
          puts "#{self.token} plays in space 7"
         "6"
      elsif board.valid_move?("8")
          puts "#{self.token} plays in space 9"
         "8"
      elsif board.valid_move?("1")
          puts "#{self.token} plays in space 2"
         "1"
      elsif board.valid_move?("3")
          puts "#{self.token} plays in space 4"
         "3"
      elsif board.valid_move?("5")
          puts "#{self.token} plays in space 6"
         "5"
      elsif board.valid_move?("7")
          puts "#{self.token} plays in space 8"
         "7"

      end
    end

  end

end
