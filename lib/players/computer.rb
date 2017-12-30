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

        def move(game_or_board)
            board = nil
            if (game_or_board.is_a?(Game))
                board = game_or_board.board
            else
                board = game_or_board
            end

            spot = 0
            while (board.taken?("#{spot+1}"))
                spot += 1
            end
            print "#{self.token}-#{spot+1} "
            "#{spot+1}"
        end
    end
end