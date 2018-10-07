module Players
  class Computer < Player

    def move(board)
      corners = [1, 3, 7, 9]
      middles = [2, 4, 6, 8]
      new_move = nil

        case board.turn_count
          when 0
              new_move = corners.sample.to_s
          when 1
              if board.cells[4] == " "
                new_move = "5"
              else
                new_move = corners.sample.to_s
              end
          else
            new_move = corners.sample
            new_move = middles.sample unless corners.any?{|x| board.cells[x.to_i - 1] == " "}
        end
        # binding.pry
      board = new_move
    end

  end
end
