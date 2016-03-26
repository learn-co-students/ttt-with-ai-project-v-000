


class Computer < Player

   def move(board)
    #if turn_count is < 4
    if board.taken?("5") == false
        input = "5"
      elsif board.taken?("1") == false
        input = "1"
      elsif board.taken?("3") == false
        input = "3"
      elsif board.taken?("7") == false
        input = "7"
      elsif board.taken?("9") == false
        input = "9"
      else ["2", "4", "6", "8"].sample

    end
  end

  # def move(board)
  #   minmax(board, token)
  # end

  # def available_positions(board)
  #   available = []
  #   board.cells.each do |cell|
  #     if cell = " "
  #       available<< cell
  #     end
  #   end
  # end
  # def place_piece()

  # def score(board, depth)
  #   if game.won?(player_1)
  #       return 10 - depth
  #   elsif game.won?(player_2)
  #       return depth - 10
  #   else
  #       return 0
  #   end
  # end

end