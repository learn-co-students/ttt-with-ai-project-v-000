module Players
  class Computer < Player

    def move(board)
      if !board.taken?("5")
        "5"
      elsif !take_corner(board).empty?
       take_corner(board).sample
     else random(board)s
      end
    end

    def take_corner(board)
      corners = ["1","3","7","9"]
      corners.select { |move| !board.taken?(move)}
    end

    def random(board)
      move = (1..9).to_a
      move.sample.to_s
    end

    # def opponent_token
    #   if self.token == "X"
    #     "O"
    #   else
    #     "X"
    #   end
    # end

    # def block_game(board)
    #   Game::WIN_COMBINATIONS.each do |combo|
    #       if board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == " "
    #         return combo[2]
    #       elsif board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] == " "
    #         return combo[1]
    #       elsif board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] == " "
    #         return combo[0]
    #       end
    #     end
    #   end
    end
  end
