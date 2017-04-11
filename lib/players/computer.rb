module Players
    class Computer < Player
        
        def move(board)
            puts ""
            if board.cells[4] == " "
                "5"
            elsif two_in_a_row(board) != ""
                two_in_a_row(board).to_s
            elsif board.cells[0] == " "
                "1"
            elsif board.cells[2] == " "
                "3"
            elsif board.cells[6] == " "
                "7"
            elsif board.cells[8] == " "
                "9"
            else
                rand(1..9).to_s
            end
        end

        def two_in_a_row(board)
            two_in_a_row = nil
            third_element = ""
            Game.combinations.detect do|array| 
                index_1 = array[0]
                index_2 = array[1]
                index_3 = array[2]

                position_1 = board.cells[index_1]
                position_2 = board.cells[index_2]
                position_3 = board.cells[index_3]

                if position_1 == "X" && position_2 == "X" || position_2 == "X" && position_3 == "X" || position_1 == "X" && position_3 == "X"
                    two_in_a_row = array
                elsif position_1 == "O" && position_2 == "O" || position_2 == "O" && position_3 == "O" || position_1 == "O" && position_3 == "O"
                    two_in_a_row = array
                else
                    false
                end
            end
            two_in_a_row
            if two_in_a_row
                two_in_a_row.each {|i| third_element = i + 1 if board.cells[i] == " "}
            end
            third_element
        end

    end
end