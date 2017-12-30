=begin
AI algorithm:
    - if there is a win move, do that
    - else if a move is required to prevent a loss, do that
    - else if center cell is open, move there
    - else if a corner cell is open, move there
    - else move to a side cell

    we prioritize center over corners over sides because they participate in 6 vs 3 vs 2 win combos, respectively
=end

module Players
    class Computer < Player
        COMPUTER_NAMES = [
            "HAL 9000",
            "WOPR",
            "SKYNET",
            "YOUR UNCLE'S DELL INSPIRON",
            "DEEP MIND"
        ]

        attr_accessor :name

        def move(board, game = nil)
            spot = nil

            if (game)
                # if a win is available, do that
                (0..8).each do |cell_index|
                    if (board.taken?("#{cell_index+1}"))
                        next
                    end

                    board.cells[cell_index] = self.token
                    
                    move_would_win = game.won?

                    board.cells[cell_index] = " "

                    if (move_would_win)
                        spot = "#{cell_index+1}"
                        break
                    end
                end
            end

            # ignore if we have already found a move...
            if (nil == spot && game)
                #if a move is required to prevent a loss, do that
                opponent_token = "O"
                if ("O" == self.token)
                    opponent_token = "X"
                end

                (0..8).each do |cell_index|
                    if (board.taken?("#{cell_index+1}"))
                        next
                    end

                    board.cells[cell_index] = opponent_token

                    opponent_move_would_win = game.won?

                    board.cells[cell_index] = " "

                    if (opponent_move_would_win)
                        spot = "#{cell_index+1}"
                        break
                    end
                end
            end

            # move to the center if the center is available
            if (nil == spot && spot = board.get_empty(Board::CENTER))
                spot
            # move to a corner if the center is taken
            elsif (nil == spot && spot = board.get_empty(Board::CORNERS))
                spot
            # move to a side if the center and all corners are taken
            elsif (nil == spot)
                spot = board.get_empty(Board::SIDES)
            end
            
            print "#{self.token}#{spot} "

            spot
        end
    end
end