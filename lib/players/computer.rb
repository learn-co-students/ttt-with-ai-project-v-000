module Players

  class Computer < Player
    ### TO DO: Implement a 'wargames' mode ####
    def move(board)
      # input = Random.rand(1..9).to_s
      if board.cells[4] == " "
        sleep(2)
        "5"
      elsif board.cells[0] == " "
        sleep(2)
        "1"
      elsif board.cells[2] == " "
        sleep(2)
        "3"
      elsif board.cells[6] == " "
        sleep(2)
        "7"
      elsif board.cells[8] == " "
        sleep(2)
        "9"
      elsif board.cells[1] == " "
        sleep(2)
        "2"
      elsif board.cells[3] == " "
        sleep(2)
        "4"
      elsif board.cells[5] == " "
        sleep(2)
        "6"
      elsif board.cells[7] == " "
        sleep(2)
        "8"
      end
    end

  end
end
