module Players
  class Computer < Player

    ##TWO IN A ROW 1,2  #2,3   #1,4    #2,5    #3,6    #4,5    #5,6    #4,7    #5,8    #6,9    #7,8    #8,9    #1,3    #1,7
    ##TWO IN A ROW     #1,9    #2,8
    #3,9
    #4,6
    #7,9


    def move(board)
      if board.position("1") == "X" && board.position("2") == "X" && !board.taken?("3")
          input = "3"
      elsif board.position("2") == "X" && board.position("3") == "X" && !board.taken?("1")
          input = "1"
      elsif board.position("1") == "X" && board.position("4") == "X" && !board.taken?("7")
          input = "7"
      elsif board.position("2") == "X" && board.position("5") == "X" && !board.taken?("8")
          input = "8"
      elsif board.position("3") == "X" && board.position("6") == "X" && !board.taken?("9")
          input = "9"
      elsif board.position("4") == "X" && board.position("5") == "X" && !board.taken?("6")
          input = "6"
      elsif board.position("5") == "X" && board.position("6") == "X" && !board.taken?("4")
          input = "4"
      elsif board.position("4") == "X" && board.position("7") == "X" && !board.taken?("1")
          input = "1"
      elsif board.position("5") == "X" && board.position("8") == "X" && !board.taken?("2")
          input = "2"
      elsif board.position("6") == "X" && board.position("9") == "X" && !board.taken?("3")
          input = "3"
      elsif board.position("7") == "X" && board.position("8") == "X" && !board.taken?("9")
          input = "9"
      elsif board.position("8") == "X" && board.position("9") == "X" && !board.taken?("7")
          input = "7"
      elsif board.position("1") == "X" && board.position("3") == "X" && !board.taken?("2")
          input = "2"
      elsif board.position("1") == "X" && board.position("7") == "X" && !board.taken?("4")
          input = "4"
      elsif board.position("1") == "X" && board.position("9") == "X" && !board.taken?("5")
          input = "5"
      elsif board.position("2") == "X" && board.position("8") == "X" && !board.taken?("5")
          input = "5"
      elsif board.position("3") == "X" && board.position("9") == "X" && !board.taken?("6")
          input = "6"
      elsif board.position("4") == "X" && board.position("6") == "X" && !board.taken?("5")
          input = "5"
      elsif board.position("7") == "X" && board.position("9") == "X" && !board.taken?("8")
          input = "8"
      elsif board.position("1") == "O" && board.position("2") == "O" && !board.taken?("3")
          input = "3"
      elsif board.position("2") == "O" && board.position("3") == "O" && !board.taken?("1")
          input = "1"
      elsif board.position("1") == "O" && board.position("4") == "O" && !board.taken?("7")
          input = "7"
      elsif board.position("2") == "O" && board.position("5") == "O" && !board.taken?("8")
          input = "8"
      elsif board.position("3") == "O" && board.position("6") == "O" && !board.taken?("9")
          input = "9"
      elsif board.position("4") == "O" && board.position("5") == "O" && !board.taken?("6")
          input = "6"
      elsif board.position("5") == "O" && board.position("6") == "O" && !board.taken?("4")
          input = "4"
      elsif board.position("4") == "O" && board.position("7") == "O" && !board.taken?("1")
          input = "1"
      elsif board.position("5") == "O" && board.position("8") == "O" && !board.taken?("2")
          input = "2"
      elsif board.position("6") == "O" && board.position("9") == "O" && !board.taken?("3")
          input = "3"
      elsif board.position("7") == "O" && board.position("8") == "O" && !board.taken?("9")
          input = "9"
      elsif board.position("8") == "O" && board.position("9") == "O" && !board.taken?("7")
          input = "7"
      elsif board.position("1") == "O" && board.position("3") == "O" && !board.taken?("2")
          input = "2"
      elsif board.position("1") == "O" && board.position("7") == "O" && !board.taken?("4")
          input = "4"
      elsif board.position("1") == "O" && board.position("9") == "O" && !board.taken?("5")
          input = "5"
      elsif board.position("2") == "O" && board.position("8") == "O" && !board.taken?("5")
          input = "5"
      elsif board.position("3") == "O" && board.position("9") == "O" && !board.taken?("6")
          input = "6"
      elsif board.position("4") == "O" && board.position("6") == "O" && !board.taken?("5")
          input = "5"
      elsif board.position("7") == "O" && board.position("9") == "O" && !board.taken?("8")
          input = "8"
      elsif !board.taken?("5")
          input = "5"
      elsif !board.taken?("1")
          input = "1"
      elsif !board.taken?("3")
          input = "3"
      elsif !board.taken?("7")
          input = "7"
      elsif !board.taken?("9")
          input = "9"
      else
        input = ["1","2","3","4","5","6","7","8","9"].sample
      end
    end
  end
end
