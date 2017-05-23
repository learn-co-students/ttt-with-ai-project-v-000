require 'pry'

module Players
    class Computer < Player
        def move(board)
            internal_board = board.cells.clone
            # if it is the first move go randomly anyway, for the challange
            # res = (board.available_indexes().sample + 1).to_s # -> Plays randomly
            scores = minMax(internal_board, 0, 2) # min max is broken, cannot look more then two levels deep
            # puts scores
            max = scores.values.max
            res = (scores.select{|k, v| v == max }.keys.sample + 1).to_s
            puts res
            res
        end

        def minMax(board, level, levels)
            scores = {}
            available_indexes(board).each do |free_spot| # for each of the free spots on the map
                tmp_board = board.clone # copy the board
                level.even? ? tmp_board[free_spot] = @token : tmp_board[free_spot] = reverse_token(@token) # fill the spot with the token of the current player
                value = minMaxScore(tmp_board)
                # binding.pry if value == -10
                if level < levels && value == 0 && !full?(tmp_board)# if we do not know what going here means, keep looking
                    value = minMax(tmp_board, level + 1, levels)
                    value = value.values.min
                end
                # value = minMaxScore(tmp_board) #get the max value
                scores[free_spot] = value
                binding.pry if value == nil
            end
            scores
        end
        #scoring system, 10 for win -10 for lose and 0 for draw
        def minMaxScore(board)
            won = won?(board)
            if won == 'X' or won == 'O'
                res = won == @token ? 10 : -10 # if we won it is worth 10 points, If he wins it is worth -10
                return res
            else
                return 0 # no one wins it is 0
            end
        end

        # stolen from game and board
        def available_indexes(board)
            res = []
            board.each.with_index{|cell, index| res << index if empty_cell(cell)}
            res
        end
        #check if a cell is empty
        def empty_cell(cell)
            cell.nil? || cell == " " || cell == ""
        end 
        #check if the board is won
        def won?(board)
            res = false
            Game::WIN_COMBINATIONS.each do |combo| #check all the combos
                # combo = combination.collect{|index| (index + 1).to_s } # transilate to the plus one with strings just to be sent back again. (why the tests suck)
                if !empty_cell(board[combo[0]])
                    if board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
                        res = board[combo[0]] # get the token at the index
                    end
                end
            end
            res
        end
        # check if the board is full
        def full?(board)
            !board.detect{|cell| (cell.nil? || cell == " " || cell == "")}
        end
        # reverse a token
        def reverse_token(token)
            token == "X" ? "O" : "X"
        end
    end
end