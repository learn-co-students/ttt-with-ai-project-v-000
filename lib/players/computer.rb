require 'pry'

module Players
    class Computer < Player

        def move(board)
           block(board) || win(board) || random_move(board)
        end

        def block(board)
            self.token == "X" ? other_player = "O" : other_player = "X"
            next_move = nil
            Game::WIN_COMBINATIONS.each do |combo|
                if board.cells[combo[0]] == other_player && board.cells[combo[1]] == other_player && board.cells[combo[2]] == ' '
                    i = combo[2]
                    next_move = (i+1).to_s
                elsif board.cells[combo[0]] == other_player && board.cells[combo[2]] == other_player && board.cells[combo[1]] == ' '
                    i = combo[1]
                    next_move = (i+1).to_s
                elsif board.cells[combo[1]] == other_player && board.cells[combo[2]] == other_player && board.cells[combo[0]] == ' '
                    i = combo[0]
                    next_move = (i+1).to_s
                end 
            end
            next_move != nil ? next_move : nil
        end 

        def win(board)
            self.token == "X" ? other_player = "O" : other_player = "X"
            next_move = nil
            Game::WIN_COMBINATIONS.each do |combo|
                if board.cells[combo[0]] == self.token && board.cells[combo[1]] == self.token && board.cells[combo[2]] == ' '
                    i = combo[2]
                    next_move = (i+1).to_s
                elsif board.cells[combo[0]] == self.token && board.cells[combo[2]] == self.token && board.cells[combo[1]] == ' '
                    i = combo[1]
                    next_move = (i+1).to_s
                elsif board.cells[combo[1]] == self.token && board.cells[combo[2]] == self.token && board.cells[combo[0]] == ' '
                    i = combo[0]
                    next_move = (i+1).to_s
                end 
            end
            next_move != nil ? next_move : nil
        end 

        def random_move(board)
            i = rand(1-9)
            if board.valid_move?(i) then i.to_s
            end
        end
    end
end