module Players
  class Computer < Player

    # WIN_COMBINATIONS = [
    #   [0,1,2],
    #   [3,4,5],
    #   [6,7,8],
    #   [0,3,6],
    #   [1,4,7],
    #   [2,5,8],
    #   [0,4,8],
    #   [2,4,6]
    # ]

    # CORNERS = ["1", "3", "7", "9"]

    def move(board)
       if (false)
       else
         make_winning_move(board)
        #  make_moves = make_winning_move(board)
        #  (make_moves + 1).to_s
       end
      # if board.valid_move?(5)
      #   "5"
      # else
      #   move = rand(1..9)
      # end
    end

    def make_winning_move(board)
    #   if board.cells[0] == self.token && board.cells[1] == self.token && board.cells[2] != self.opp_token
    #     return 2
    #   elsif board.cells[3] == self.token && board.cells[4] == self.token && board.cells[5] != self.opp_token
    #     return 5
    #   elsif board.cells[6] == self.token && board.cells[7] == self.token && board.cells[8] != self.opp_token
    #     return 8
    #   elsif board.cells[0] == self.token && board.cells[3] == self.token && board.cells[6] != self.opp_token
    #     return 6
    #   elsif board.cells[1] == self.token && board.cells[4] == self.token && board.cells[7] != self.opp_token
    #     return 7
    #   elsif board.cells[2] == self.token && board.cells[5] == self.token && board.cells[8] != self.opp_token
    #     return 8
    #   elsif board.cells[0] == self.token && board.cells[4] == self.token && board.cells[8] != self.opp_token
    #     return 8
    #   elsif board.cells[2] == self.token && board.cells[4] == self.token && board.cells[6] != self.opp_token
    #     return 6
    #   end
    # end
    # opp_count = win_combo.select{|spot| spot == self.token}.length
      Game::WIN_COMBINATIONS.each do |win_combo|
        if board.cells[win_combo[0]] != " " && board.cells[win_combo[1]] != " "
          binding.pry
        end
      end
    end

  end #close class
end #close module
