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

    # opp_count = win_combo.select{|spot| spot == self.token}.length
      Game::WIN_COMBINATIONS.each do |win_combo|
        # binding.pry
        if board.cells[win_combo[0]] != " " && board.cells[win_combo[1]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[1]]
          move = (win_combo[2] + 1).to_s
        elsif board.cells[win_combo[1]] != " " && board.cells[win_combo[2]] != " " && board.cells[win_combo[1]] == board.cells[win_combo[2]]
          move = (win_combo[0] + 1).to_s
        elsif board.cells[win_combo[0]] != " " && board.cells[win_combo[2]] != " " && board.cells[win_combo[0]] == board.cells[win_combo[2]]
          move = (win_combo[1] + 1).to_s
        end
      end
    end

  end #close class
end #close module
