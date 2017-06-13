module Players
  class Computer < Player

    def valid_move
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      valid_moves.sample
    end

    # def corners
    #   c = [1,3,7,9].sample.to_s
    # end
    #
    # def diamonds
    #   d = [2,4,6,8].sample.to_s
    # end

    def move(board)
      if board.valid_move?("5")
        computer_move = "5"
      elsif board.valid_move?("1")
        computer_move = "1"
      elsif board.valid_move?("3")
        computer_move = "3"
      elsif board.valid_move?("7")
        computer_move = "7"
      elsif board.valid_move?("4")
        computer_move = "4"
      elsif board.valid_move?("6")
        computer_move = "6"
      elsif board.valid_move?("2")
        computer_move = "2"
      elsif board.valid_move?("8")
        computer_move = "8"
      elsif board.valid_move?("9")
        computer_move = "9"
      else
       valid_move
      end #end if
      computer_move
    end #end def
  end #end Class
end #end Module
