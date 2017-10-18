module Players

  #remember that you are trying to return the position, as a string, e.g. "1"

  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2], # Top row
      [3,4,5], # Middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [2,4,6], #first diagonal
      [0,4,8] #second diagonal
    ]
    #main method, #move
    def move(board)

      # offense > defense > take middle > take corner
      if offense(board)
        offense(board)
      elsif defense(board)
        defense(board)
      elsif take_middle(board)
        take_middle(board)
      elsif take_corners(board)
        take_corners(board)
      else
        take_edges(board)

      end
    end

    #helper methods
    def opp_token
      self.token == "X" ? "O" : "X"
    end

    def take_corners(board)
      ["1", "3", "7", "9"].select{|input| !board.taken?(input) }.sample
    end

    def take_edges(board)
      ["2", "4", "6", "8"].select{|input| !board.taken?(input) }.sample
    end

    def take_middle(board)
      "5" unless board.taken?("5")
    end

    def offense(board)
      Game::WIN_COMBINATIONS.each do |win_combination|
        # board.cells[0] has computer token as well as board.cells[1] and board.cells[2] is board.taken?((combo[2] + 1).to_s)
        # combo[0] is 0, then (combo[0] + 1).to_s is the return value "1"
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]
        #  X | X |
        # -----------
        #
        #
        #
        if position_1 == self.token && position_1 == position_2 && position_3 == " "
          return (win_index_3 + 1).to_s
        elsif position_1 == self.token && position_1 == position_3 && position_2 == " "
          return (win_index_2 + 1).to_s
        elsif position_2 == self.token && position_2 == position_3 && position_1 == " "
          return (win_index_1 + 1).to_s
        end
      end
      false
    end

    def defense(board)
      Game::WIN_COMBINATIONS.each do |win_combination|
        # board.cells[0] has computer token as well as board.cells[1] and board.cells[2] is board.taken?((combo[2] + 1).to_s)
        # combo[0] is 0, then (combo[0] + 1).to_s is the return value "1"
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]
        position_2 = board.cells[win_index_2]
        position_3 = board.cells[win_index_3]

        if position_1 == opp_token && position_1 == position_2 && position_3 == " "
          return (win_index_3 +1).to_s
        elsif position_1 == opp_token && position_1 == position_3 && position_2 == " "
          return (win_index_2 +1).to_s
        elsif position_2 == opp_token && position_2 == position_3 && position_1 == " "
          return (win_index_1 +1).to_s
        end
      end
      false
    end

  end

end
