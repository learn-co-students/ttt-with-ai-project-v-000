# class Players
#   class Computer < Player
#     def move(board)
#       input = rand(1..9).to_s
#       if board.valid_move?(input)
#         input
#       else
#         move(board)
#       end
#     end
#   end
# end

class Players
  class Computer < Player
    def move(board)
      # if two identical tokens are present in
      # WIN_COMBINATIONS, next move goes on same row

    move = nil

      WIN_COMBINATIONS.each do | el |
        selected = el.select {|i| board.cells[i] == self.token}
        if selected.length == 2
          # binding.pry
          num = el - selected
          move = num[0] + 1
          # break
        end
      end

      if move != nil && board.valid_move?(move)
        # binding.pry
        move
      else
        input = rand(1..9).to_s
        if board.valid_move?(input)
          input
        else
          move(board)
        end
      end

    end
  end
end
