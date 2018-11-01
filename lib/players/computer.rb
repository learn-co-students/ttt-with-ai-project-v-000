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
          #EDGE CASES
          #If player_2 DEFENDs then TRAP else WIN)
          when 1 then board.cells[2] == "O" ? o_second = 2; "1" : "3"
          when 3 then board.cells[0] == "O" ? o_second = 0; "7" : "1"
          when 5 then board.cells[8] == "O" ? o_second = 8; "3" : "9"
          when 7 then board.cells[6] == "O" ? o_second = 6; "9" : "7"
          #CORNER CASES
          when 0
            #If player_2 takes close EDGE then COUNTER and TRAP
            if    board.cells[1] == "O"; o_second = 1; "3"
            elsif board.cells[3] == "O"; o_second = 3; "7"
            #If player_2 takes far EDGE then TRAP
            elsif board.cells[5] == "O"; o_second = 5; "7"
            elsif board.cells[7] == "O"; o_second = 7; "3"
            #If player_2 takes CORNER then DEFEND
            elsif board.cells[2] == "O"; o_second = 2; "2"
            elsif board.cells[6] == "O"; o_second = 6; "4"
            end
          when 2
            if    board.cells[1] == "O"; o_second = 1; "1"
            elsif board.cells[5] == "O"; o_second = 5; "9"

            elsif board.cells[3] == "O"; o_second = 3; "9"
            elsif board.cells[7] == "O"; o_second = 7; "1"

            elsif board.cells[0] == "O"; o_second = 0; "2"
            elsif board.cells[8] == "O"; o_second = 8; "6"
            end
          when 6
            if    board.cells[3] == "O"; o_second = 3; "1"
            elsif board.cells[7] == "O"; o_second = 7; "9"

            elsif board.cells[1] == "O"; o_second = 1; "9"
            elsif board.cells[5] == "O"; o_second = 5; "1"

            elsif board.cells[0] == "O"; o_second = 0; "4"
            elsif board.cells[8] == "O"; o_second = 8; "8"
            end
          when 8
            if    board.cells[5] == "O"; o_second = 5; "3"
            elsif board.cells[7] == "O"; o_second = 7; "7"

            elsif board.cells[1] == "O"; o_second = 1; "7"
            elsif board.cells[3] == "O"; o_second = 3; "3"

            elsif board.cells[2] == "O"; o_second = 2; "6"
            elsif board.cells[6] == "O"; o_second = 6; "8"
            end
          end
        end

        if board.turn_count == 6
          case [o_first, o_second]
          #EDGE CASES
          #If player_2 DEFENDs horizontally/vertically then WIN diagonally
          when [1, 2] then board.cells[3] == "O" ? "9" : "4"
          when [3, 0] then board.cells[7] == "O" ? "3" : "8"
          when [5, 8] then board.cells[1] == "O" ? "7" : "2"
          when [7, 6] then board.cells[5] == "O" ? "7" : "6"
          #CORNER CASES

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
