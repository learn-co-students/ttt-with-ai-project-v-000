=begin
AI algorithm:
    - if there is a win move, do that
    - if a move is required to prevent a loss, do that
    - if a move will force a win on the next turn, do that
    - otherwise,
        - move to center (highest value spot as it participates in 6 win combos)
        - if center not open, move to a corner (next highest value location, participates in 3 win combos)
            - prioritize any corner that could still participate in a win combo
        - if no corners open, move to a side (lowest value location, only participates in 2 win combos)
            - prioritize any side cell that could still participate in a win combo
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
                
                # go through all the slots
                # if a slot is taken, move to the next
                # 
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