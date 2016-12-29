module Players
  class Computer < Player
    attr_accessor :intelligence

    def move(board)
      intelligence == 'smart' ? smart_move(board).to_s : dumb_move(board).to_s
    end

    def dumb_move(board)
      arr   = (1..9).to_a
      input = arr.sample

      until board.valid_move?(input) || arr.empty?
        arr - [input]
        input = arr.sample
      end

      input
    end

    def smart_move(board)
      if win_possible?
        winning_index
      elsif opponent.win_possible?
        opponent.winning_index
      elsif player_1?
        smart_early_move_for_player_one(board)
      else
        smart_early_move_for_player_two(board)
      end + 1
    end

    def smart_early_move_for_player_two(board)
      if board_positions.empty?

        if opponent.board_positions[0] == Game::CENTER
          Game::CORNERS.sample
        else
          Game::CENTER
        end

      elsif board_positions.size == 1 && board_positions[0] == Game::CENTER

        if Game::CORNERS.include?(opponent.board_positions[0])

          if Game::SIDES.include?(opponent.board_positions[1])
            opponent.opposite_corner(0)
          elsif Game::CORNERS.include?(opponent.board_positions[1])
            Game::SIDES.sample
          end

        elsif Game::SIDES.include?(opponent.board_positions[0])
          if Game::CORNERS.include?(opponent.board_positions[1])
            opponent.opposite_corner(1)
          end
          Game::CORNERS.sample
        end

      elsif board_positions.size == 1 && Game::CORNERS.include?(board_positions[0])
        return opposite_corner(0) if board.valid_move?(opposite_corner(0) + 1)
        Game::CORNERS.sample

      else
        rand(9)
      end
    end

    def smart_early_move_for_player_one(board)
      if board_positions.empty?
        Game::CORNERS.sample
      elsif board.valid_move?(opposite_corner(0) + 1)
        opposite_corner(0)
      elsif Game::CORNERS.any? { |i| board.valid_move?(i + 1) }
        Game::CORNERS.sample
      else
        rand(9)
      end
    end
  end
end
