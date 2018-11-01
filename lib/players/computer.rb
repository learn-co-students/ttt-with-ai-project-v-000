module Players
  class Computer < Player
    def move(board)
      #If player_1 (X)
      if self.token == "X"
        #Save player_2's moves
        o_first = nil
        o_second = nil
        o_third = nil
        o_fourth = nil
        #On first turn, take CENTER
        if board.turn_count == 0 then "5"; end

        if board.turn_count == 2
          #EDGE CASES
          if board.cells.values_at(1, 3, 5, 7).include?("O")
            case board.cells.find_index("O")
            #If player_2 takes EDGE then take a far CORNER
            when 1 then o_first = 1; "7"
            when 3 then o_first = 3; "9"
            when 5 then o_first = 5; "1"
            when 7 then o_first = 7; "3"
            end
          end

          #CORNER CASES
          if board.cells.values_at(0, 2, 6, 8).include?("O")
            case board.cells.find_index("O")
            #If player_2 takes CORNER then take opposite CORNER
            when 0 then o_first = 0; "9"
            when 2 then o_first = 2; "7"
            when 6 then o_first = 6; "3"
            when 8 then o_first = 8; "1"
            end
          end
        end

        if board.turn_count == 4
          case o_first
          #EDGE CASES (if player_2 DEFENDs then COUNTER-ATK else WIN)
          when 1 then board.cells[2] == "O" ? "1" : "3"
          when 3 then board.cells[0] == "O" ? "7" : "1"
          when 5 then board.cells[8] == "O" ? "3" : "9"
          when 7 then board.cells[6] == "O" ? "9" : "7"
          #CORNER CASES
          #CORNER-TO-CLOSE-EDGE CASE
          #If player_2 takes close EDGE then COUNTER-ATK)
          when 0
            if    board.cells[1] == "O"; o_second = 1; "3"
            elsif board.cells[3] == "O"; o_second = 3; "7"; end
          when 2
            if    board.cells[1] == "O"; o_second = 1; "1"
            elsif board.cells[5] == "O"; o_second = 5; "9"; end
          when 6
          when 8
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
