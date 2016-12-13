module Players
  class Computer < Player


    def move(board)
      # binding.pry
      board.taken?("5")
      board.update("5", player_token)
      # valid_move = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      # if board == valid_move[0] || board == valid_move[1] || board == valid_move[2] || board == valid_move[3] || board == valid_move[4] || board == valid_move[5] || board == valid_move[6] || board == valid_move[7] || board == valid_move[8]
      #
      #   board
      end






  end
end
