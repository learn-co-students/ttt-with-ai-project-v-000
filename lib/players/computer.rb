module Players
  class Computer < Player

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
#      user_input = valid_moves.sample
#      user_input
      corner_indexes = [0, 2, 6, 8]
      middle_index = [4]
      edge_indexes = [1, 3, 5, 7]
      if self.token == "X"
        case board.turn_count
          when 0
            user_input = "1"
          when 2
            if corner_indexes.include?(board.cells.index("O"))
              if board.cells.index("O") == 2
                user_input = "7"
              else
                user_input = "3"
              end
            elsif middle_index.include?(board.cells.index("O"))
              user_input = "9"
            else
              user_input = "3"
            end
          when 4
            if board.win_possible? != nil
              board.win_possible?.each do |index|
                if board.cells[index] == " "
                  user_input = (index + 1).to_s
                end
              end
              user_input
            else
              user_input = valid_moves.sample
            end
          when 6
            if board.win_possible? != nil
              board.win_possible?.each do |index|
                if board.cells[index] == " "
                  user_input = (index + 1).to_s
                end
              end
              user_input
            else
              user_input = valid_moves.sample
            end
          when 8
            user_input = (board.cells.index(" ") + 1).to_s
        end
      elsif self.token == "O"
        case board.turn_count
          when 1
            if corner_indexes.include?(board.cells.index("X"))
              user_input = "5"
            elsif middle_index.include?(board.cells.index("X"))
              user_input = "1"
            else
              user_input = "5"
            end
          when 3
            if board.win_possible? != nil
              board.win_possible?.each do |index|
                if board.cells[index] == " "
                  user_input = (index + 1).to_s
                end
              end
              user_input
            else
              if board.cells[7] == "X"
                user_input = "7"
              else
                user_input = "2"
              end
            end
          when 5
            if board.win_possible? != nil
              board.win_possible?.each do |index|
                if board.cells[index] == " "
                  user_input = (index + 1).to_s
                end
              end
              user_input
            else
              user_input = valid_moves.sample
            end
          when 7
            if board.win_possible? != nil
              board.win_possible?.each do |index|
                if board.cells[index] == " "
                  user_input = (index + 1).to_s
                end
              end
              user_input
            else
              user_input = valid_moves.sample
            end
        end
      end
      user_input
    end

  end
end
