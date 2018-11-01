module Players
  class Computer < Player
    def move(board)
      #If player_1 (X)
      if self.token == "X"
        #Take CENTER on first turn
        if board.turn_count == 0
          "5"
        end

        if board.turn_count == 2
          #If any CORNER contains "O"
          if board.cells.values_at(0, 2, 6, 8).include?("O")
            case board.cells.find_index("O")
            when 0 then "9"
            when 2 then "7"
            when 6 then "3"
            when 8 then "1"
            end
          end

          #If any EDGE contains "O"
          if board.cells.values_at(1, 3, 5, 7).include?("O")
            case board.cells.find_index("O")
            when 1 then "7"
            when 3 then "9"
            when 5 then "1"
            when 7 then "3"
            end
          end
        end

      end
    end
  end
end

#Non-Index Number     Index Number
#Center: 5            [4]
#Edge:   2, 4, 6, 8   [1, 3, 5, 7]
#Corner: 1, 3, 5, 7   [0, 2, 4, 6]
#
#        1 2 3        0 1 2
#        4 5 6        3 4 5
#        7 8 9        6 7 8
