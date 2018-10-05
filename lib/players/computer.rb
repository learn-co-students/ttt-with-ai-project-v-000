require_relative "../player.rb"

module Players
  class Computer < Player
    @@corner_move = [1, 3, 7, 9].sample.to_s
    @@edge_move = [2, 4, 6, 8].sample.to_s
    @@center_move = "5"
    @@random_move = (1..9).to_a.sample.to_s


    def move(board)
      # computer strategy
      move = "5"
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = @@corner_move
      end
      move
      # @@random_move
    end
    
    
    # def first_move_x(board)
    #   "5"
    # end

    # def first_move_y(board)
    #   board.cells[4] == "X" ? first_move_y = @@corner_move : first_move_y = "5"
    # end

    # def second_move_x(board)
    #   if board.cells[1] == "O"
    #     second_move_x = [7, 9].sample.to_s
    #   elsif board.cells[3] == "O"
    #     second_move_x = [3, 9].sample.to_s
    #   elsif board.cells[5] == "O"
    #     second_move_x = [1, 7].sample.to_s
    #   elsif board.cells[9] == "O"
    #     second_move_x = [1, 3].sample.to_s
    #   elsif board.cells[0] == "O"
    #     second_move_x = "9"
    #   elsif board.cells[2] == "O"
    #     second_move_x = "7"
    #   elsif board.cells[6] == "O"
    #     second_move_x = "3"
    #   elsif board.cells[8] == "O"
    #     second_move_x = "1"
    #   end
    #   second_move_x
    # end


  end
end