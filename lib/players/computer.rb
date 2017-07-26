module Players
  class Computer < Player

    def move(board)
      if  board.cells[4] == " "
        "5"
      elsif [1,3,7,9].any? {|i| !board.taken?(i)}
        move = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      else [2,4,6,8].any? {|i| !board.taken?(i)}
        move = [2,4,6,8].detect{|i| !board.taken?(i)}.to_s
      end
    end

    # if  board.cells[4] == " "
    #   "5"
    # elsif board.cells[0] == " "
    #   "1"
    # elsif board.cells[2] == " "
    #   "3"
    # elsif board.cells[6] == " "
    #   "7"
    # elsif board.cells[8] == " "
    #   "9"
    # elsif board.cells[1] == " "
    #   "2"
    # elsif board.cells[3] == " "
    #   "4"
    # elsif board.cells[5] == " "
    #   "6"
    # elsif board.cells[7] == " "
    #   "8"
    # end

  end
end
