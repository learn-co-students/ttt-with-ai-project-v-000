module Players
  class Computer < Player

    def move(board)
    #Top row, prevent win
      if board.cells[0] != self.token && board.cells[0] != " " && board.cells[1] != self.token && board.cells[1] != " "
        if board.valid_move?("3")
          puts "#{self.token} plays in space 3"
            "3"
        end
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[2] != self.token && board.cells[2] != " "
        if board.valid_move?("1")
          puts "#{self.token} plays in space 1"
            "1"
        end
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[2] != self.token && board.cells[2] != " "
        if board.valid_move?("2")
          puts "#{self.token} plays in space 2"
            "2"
        end
    #Middle row, prevent win
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[4] != self.token && board.cells[4] != " "
        if board.valid_move?("6")
          puts "#{self.token} plays in space 6"
            "6"
        end
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[5] != self.token && board.cells[5] != " "
        if board.valid_move?("4")
          puts "#{self.token} plays in space 4"
            "4"
        end
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[5] != self.token && board.cells[5] != " "
        if board.valid_move?("5")
          puts "#{self.token} plays in space 5"
          "5"
        end
    #Bottom row, prevent win
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[7] != self.token && board.cells[7] != " "
        if board.valid_move?("9")
          puts "#{self.token} plays in space 9"
          "9"
        end
      elsif board.cells[7] != self.token && board.cells[7] != " " && board.cells[8] != self.token && board.cells[8] != " "
        if board.valid_move?("7")
          puts "#{self.token} plays in space 7"
          "7"
        end
      elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[8] != self.token && board.cells[8] != " "
        if board.valid_move?("8")
          puts "#{self.token} plays in space 8"
          "8"
        end
    #Kitty corner right to left, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[4] != self.token && board.cells[4] != " "
        if board.valid_move?("9")
          puts "#{self.token} plays in space 9"
          "9"
        end
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[8] != self.token && board.cells[8] != " "
        if board.valid_move?("1")
          puts "#{self.token} plays in space 1"
          "1"
        end
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 5"
          "5"
    #Kitty corner left to right, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[4] != self.token && board.cells[4] != " "
          puts "#{self.token} plays in space 7"
          "7"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 3"
          "3"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 5"
          "5"
      #Left column, prevent win
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[3] != self.token && board.cells[3] != " "
          puts "#{self.token} plays in space 7"
          "7"
      elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 1"
          "1"
      elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[6] != self.token && board.cells[6] != " "
          puts "#{self.token} plays in space 4"
          "4"
      #Middle column, prevent win
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[4] != self.token && board.cells[4] != " "
          puts "#{self.token} plays in space 8"
          "8"
      elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[7] != self.token && board.cells[7] != " "
          puts "#{self.token} plays in space 2"
          "2"
      elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[7] != self.token && board.cells[7] != " "
          puts "#{self.token} plays in space 5"
          "5"
      #Right column, prevent win
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[5] != self.token && board.cells[5] != " "
          puts "#{self.token} plays in space 9"
          "9"
      elsif board.cells[5] != self.token && board.cells[5] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 3"
          "3"
      elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[8] != self.token && board.cells[8] != " "
          puts "#{self.token} plays in space 6"
          "6"
      elsif board.valid_move?("5")
          puts "#{self.token} plays in space 5"
         "5"
      elsif board.valid_move?("1")
          puts "#{self.token} plays in space 1"
         "1"
      elsif board.valid_move?("3")
          puts "#{self.token} plays in space 3"
         "3"
      elsif board.valid_move?("7")
          puts "#{self.token} plays in space 7"
         "7"
      elsif board.valid_move?("9")
          puts "#{self.token} plays in space 9"
         "9"
      elsif board.valid_move?("2")
          puts "#{self.token} plays in space 2"
         "2"
      elsif board.valid_move?("4")
          puts "#{self.token} plays in space 4"
         "4"
      elsif board.valid_move?("6")
          puts "#{self.token} plays in space 6"
         "6"
      elsif board.valid_move?("8")
          puts "#{self.token} plays in space 8"
         "8"

      end
    end

  end

end


# if board.cells[0] != self.token && board.cells[0] != " " && board.cells[1] != self.token && board.cells[1] != " "
#   puts "#{self.token} plays in space 3"
#     "3"
# elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[2] != self.token && board.cells[2] != " "
#   puts "#{self.token} plays in space 1"
#     "1"
# elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[2] != self.token && board.cells[2] != " "
#   puts "#{self.token} plays in space 2"
#     "2"
# #Middle row, prevent win
# elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[4] != self.token && board.cells[4] != " "
#   puts "#{self.token} plays in space 6"
#     "6"
# elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[5] != self.token && board.cells[5] != " "
#   puts "#{self.token} plays in space 4"
#     "4"
# elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[5] != self.token && board.cells[5] != " "
#     puts "#{self.token} plays in space 5"
#     "5"
# #Bottom row, prevent win
# elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[7] != self.token && board.cells[7] != " "
#     puts "#{self.token} plays in space 9"
#     "9"
# elsif board.cells[7] != self.token && board.cells[7] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 7"
#     "7"
# elsif board.cells[6] != self.token && board.cells[6] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 8"
#     "8"
# #Kitty corner right to left, prevent win
# elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[4] != self.token && board.cells[4] != " "
#     puts "#{self.token} plays in space 9"
#     "9"
# elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 1"
#     "1"
# elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 5"
#     "5"
# #Kitty corner left to right, prevent win
# elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[4] != self.token && board.cells[4] != " "
#     puts "#{self.token} plays in space 7"
#     "7"
# elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[6] != self.token && board.cells[6] != " "
#     puts "#{self.token} plays in space 3"
#     "3"
# elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[6] != self.token && board.cells[6] != " "
#     puts "#{self.token} plays in space 5"
#     "5"
# #Left column, prevent win
# elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[3] != self.token && board.cells[3] != " "
#     puts "#{self.token} plays in space 7"
#     "7"
# elsif board.cells[3] != self.token && board.cells[3] != " " && board.cells[6] != self.token && board.cells[6] != " "
#     puts "#{self.token} plays in space 1"
#     "1"
# elsif board.cells[0] != self.token && board.cells[0] != " " && board.cells[6] != self.token && board.cells[6] != " "
#     puts "#{self.token} plays in space 4"
#     "4"
# #Middle column, prevent win
# elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[4] != self.token && board.cells[4] != " "
#     puts "#{self.token} plays in space 8"
#     "8"
# elsif board.cells[4] != self.token && board.cells[4] != " " && board.cells[7] != self.token && board.cells[7] != " "
#     puts "#{self.token} plays in space 2"
#     "2"
# elsif board.cells[1] != self.token && board.cells[1] != " " && board.cells[7] != self.token && board.cells[7] != " "
#     puts "#{self.token} plays in space 5"
#     "5"
# #Right column, prevent win
# elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[5] != self.token && board.cells[5] != " "
#     puts "#{self.token} plays in space 9"
#     "9"
# elsif board.cells[5] != self.token && board.cells[5] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 3"
#     "3"
# elsif board.cells[2] != self.token && board.cells[2] != " " && board.cells[8] != self.token && board.cells[8] != " "
#     puts "#{self.token} plays in space 6"
#     "6"
# elsif board.valid_move?("5")
#     puts "#{self.token} plays in space 5"
#    "5"
# elsif board.valid_move?("1")
#     puts "#{self.token} plays in space 1"
#    "1"
# elsif board.valid_move?("3")
#     puts "#{self.token} plays in space 3"
#    "3"
# elsif board.valid_move?("7")
#     puts "#{self.token} plays in space 7"
#    "7"
# elsif board.valid_move?("9")
#     puts "#{self.token} plays in space 9"
#    "9"
# elsif board.valid_move?("2")
#     puts "#{self.token} plays in space 2"
#    "2"
# elsif board.valid_move?("4")
#     puts "#{self.token} plays in space 4"
#    "4"
# elsif board.valid_move?("6")
#     puts "#{self.token} plays in space 6"
#    "6"
# elsif board.valid_move?("8")
#     puts "#{self.token} plays in space 8"
#    "8"
#
# end
