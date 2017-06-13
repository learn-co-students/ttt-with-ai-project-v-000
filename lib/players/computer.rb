module Players
  class Computer < Player
    def move(board)

      if board.turn_count == 1 && board.valid_move?("5")
        computer_move = "5"
      elsif board.turn_count == 2 && !board.taken?(user_input)
        computer_move = "1"
      elsif board.turn_count == 3 && !board.taken?(user_input)
        computer_move = "3"
      elsif board.turn_count == 4 && !board.taken?(user_input)
        computer_move = "7"
      elsif board.turn_count == 5 && !board.taken?(user_input)
        computer_move = "4"
      elsif board.turn_count == 6 && !board.taken?(user_input)
        computer_move = "6"
      elsif board.turn_count == 7 && !board.taken?(user_input)
        computer_move = "2" || computer_move = "8"
      end #end if
    end #end def
  end #end Class
end #end Module
