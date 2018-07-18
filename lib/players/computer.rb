require 'pry'

module Players
  class Computer < Player

  #corners are 1 ,3, 7, 9
  #middles are 2, 4, 6, 8
  #players have tokens so how do I know which token I am?

#defines the same game over and over
    # def move(board)
    #
    #   if board.valid_move?("5")
    #     "5"
    #   elsif [1,3,7,9].find {|p| board.valid_move?(p)}
    #     [1,3,7,9].find {|p| board.valid_move?(p)}
    #   else
    #     [2,4,6,8].find {|p| board.valid_move?(p)}
    #   end
    # end

#defines a totally random game
    # def move(board)
    #   if !board.taken?("5")
    #     "5"
    #   else
    #     a = [1,2,3,4,6,7,8,9]
    #     b = a.sample
    #     until board.valid_move?(b)
    #       b = a.sample
    #     end
    #     b
    #   end
    # end

    def move(board)

      block = Game::WIN_COMBINATIONS.find do |win_combo|
        (board.cells[win_combo[0]] == board.cells[win_combo[1]] && board.cells[win_combo[2]] == " " && board.cells[win_combo[0]] != " ") || (board.cells[win_combo[1]] == board.cells[win_combo[2]] && board.cells[win_combo[0]] == " " && board.cells[win_combo[1]] != " ") || (board.cells[win_combo[0]] == board.cells[win_combo[2]] && board.cells[win_combo[1]] == " " && board.cells[win_combo[0]] != " ")
      end
     #  binding.pry
      if block != nil
         block_cell = block.find {|blank| board.cells[blank] == " "}
         block_cell+1
      elsif board.cells.find {|p| }
        current_token = self.token
      else
        a = [1,2,3,4,5,6,7,8,9]
        b = a.sample
        until board.valid_move?(b)
          b = a.sample
        end
        b
      end
    end



  end
end
