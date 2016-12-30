module Players
  class Computer < Player
    CORNERS = Game::CORNERS
    SIDES   = Game::SIDES
    CENTER  = Game::CENTER

    attr_accessor :intelligence

    # If you wanna be dumb, be dumb. And if you wanna be smart, be smart. There's a million things you can be, you know
    # that there are.
    def move(board)
      intelligence == 'smart' ? smart_move(board).to_s : dumb_move(board).to_s
    end

    # Check if a random square is valid until you run out of choices.
    def dumb_move(board)
      arr   = (1..9).to_a
      input = arr.sample

      until board.valid_move?(input) || arr.empty?
        arr - [input]
        input = arr.sample
      end

      input
    end

    # Make an intelligent move depending on the situation.
    def smart_move(board)

      # First check if a win is possible for either player, and if it is then take the first winning square.
      if win_possible?(board)
        winning_index
      elsif opponent.win_possible?(board)
        opponent.winning_index

      # If not, make a smart move for your turn.
      elsif player_1?
        smart_early_move_for_player_one(board)
      else
        smart_early_move_for_player_two(board)
      end + 1
    end

    # Strategy if you're going second.
    def smart_early_move_for_player_two(board)

      # If it's your first turn and the opponent took the center, take a corner, otherwise take the center.
      if board_positions.empty?
        if opponent.board_positions[0] == CENTER
          CORNERS.sample
        else
          CENTER
        end

      # But if it's your second turn...
      elsif board_positions.size == 1

        # And your first turn was the center...
        if board_positions[0] == CENTER

          # And your opponent's first move was a corner...
          if CORNERS.include?(opponent.board_positions[0])

            # And their second move was a side, take the opposite corner from their first move.
            if SIDES.include?(opponent.board_positions[1])
              opponent.opposite_cell(0)

            # But if their second move was another corner, take a random side.
            else
              SIDES.sample
            end

          # But if your opponent's first move was a side...
          elsif SIDES.include?(opponent.board_positions[0])

            # And their second move was a corner, take the opposite corner from their second move.
            if CORNERS.include?(opponent.board_positions[1])
              opponent.opposite_cell(1)

            # But if their second move was another side, check if the two sides are adjacent. If they are, take
            # the corner between them, or else take a random corner.
            else
              case opponent.board_positions.sort
              when [1, 3]
                0
              when [1, 5]
                2
              when [3, 7]
                6
              when [5, 7]
                8
              else
                CORNERS.sample
              end
            end
          end

        # If it's your second turn and your first move was a corner, and the opposite corner is open, take it.
        # Otherwise take a random corner.
        else
          if board.valid_move?(opposite_cell(0) + 1)
            opposite_cell(0)
          else
            CORNERS.sample
          end
        end

      # If all else fails, try a random square.
      else
        rand(9)
      end
    end

    # Strategy if you're going first.
    def smart_early_move_for_player_one(board)

      # If it's your first turn take a random corner. If it's your second turn and the opposite corner is available
      # then take it. If it's not available but another corner is, take one. Or else take a random square.
      if board_positions.empty?
        CORNERS.sample
      elsif board.valid_move?(opposite_cell(0) + 1)
        opposite_cell(0)
      elsif CORNERS.any? { |i| board.valid_move?(i + 1) }
        CORNERS.sample
      else
        rand(9)
      end
    end
  end
end
