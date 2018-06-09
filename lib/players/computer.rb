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

# (1..9.to_a.sample) randomly selects a number

# def move(board, game=Game.new)
#   return_value = nil
#   current_token = game.current_player.token
#   opponent_token = current_token == "O" ? "X" : "O"
#   edges_array = [1, 3, 5, 7]
#   corners_array = [0, 2, 6, 8]
#
#  if board.turn_count == 0
#    return 5
#  end
#
#  if board.turn_count == 2
#    edges_array.each do |index|
#      if board.cells[index] == opponent_token
#        ##index is the edge index at which the opponent went
#        case index
#        when 1
#          return_value = [7, 9].sample
#        when 3
#          return_value = [3, 7].sample
#        when 5
#          return_value = [1, 3].sample
#        else
#          return_value = [1, 9].sample
#        end
#      end
#    end
#
#  end
#
#
#   resultsArr = []
#   board.cells.each_with_index do |cell, i|
#     if cell == " "
#       resultArr << i + 1
#     end
#    end
#    resultsArr.sample
#  end
# end

  end
end
