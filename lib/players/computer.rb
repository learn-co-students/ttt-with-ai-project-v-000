module Players
    class Computer < Player

        WIN_COMBINATIONS = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [0, 4, 8],
            [2, 4, 6]
        ]

        def move(board)
            case board.turn_count
            when 0
                "3"
            when 1
                random_move(board)
            when 2
                turn_3(board)
            when 3
                random_move(board)
            when 4
                turn_5(board)
            when 6
                turn_7(board)
            when 8
                turn_7(board)
            else
                random_move(board)
            end

        end

        def random_move(board)
            binding.pry
            input = "1"
            until board.valid_move?(input)
                input = rand(1..9).to_s
            end
            input
        end

        def turn_3(board)
            board.cells[6] == "O" ? "9" : "7"
        end

        def turn_5(board)
            if kill?(board)
                return kill?(board)
            elsif block?(board)
                return block?(board)
            else
                return "1"
            end 
        end

        def turn_7(board)
            if kill?(board)
                return kill?(board)
            elsif block?(board)
                return block?(board)
            else
                random_move(board)
            end 
        end

        def kill?(board)
            WIN_COMBINATIONS.each do |a|
                if board.cells[a[0]] == " " && board.cells[a[1]] == "X" && board.cells[a[2]] == "X"
                    return (a[0]+1).to_s
                elsif board.cells[a[0]] == "X" && board.cells[a[1]] == " " && board.cells[a[2]] == "X"
                    return (a[1]+1).to_s
                elsif board.cells[a[0]] == "X" && board.cells[a[1]] == "X" && board.cells[a[2]] == " "
                    return (a[2]+1).to_s
                end
            end
            return false
        end

        def block?(board)
            WIN_COMBINATIONS.each do |a|
                if board.cells[a[0]] == " " && board.cells[a[1]] == "O" && board.cells[a[2]] == "O"
                    return (a[0]+1).to_s
                elsif board.cells[a[0]] == "O" && board.cells[a[1]] == " " && board.cells[a[2]] == "O"
                    return (a[1]+1).to_s
                elsif board.cells[a[0]] == "O" && board.cells[a[1]] == "O" && board.cells[a[2]] == " "
                    return (a[2]+1).to_s
                end
            end
            return false
        end
    end
end