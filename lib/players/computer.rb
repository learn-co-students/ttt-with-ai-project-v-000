module Players
  class Computer < Player

    def move(board)
      next_move = nil

      if !board.taken?(5)
        next_move = "5"

      elsif !board.taken?(1)
        next_move = "1"

      else
        Game::WIN_COMBINATIONS.find do |combos|

          if [board.position(combos[0] + 1), board.position(combos[1] + 1), board.position(combos[2] + 1)].uniq == token && [board.position(combos[0] + 1), board.position(combos[1] + 1), board.position(combos[2] + 1)].size == 2
            next_move = combos.select{ |space| !board.taken?(space + 1)}.to_i.+(1).to_s

          elsif [board.position(combos[0] + 1), board.position(combos[1] + 1), board.position(combos[2] + 1)].uniq != token && [board.position(combos[0] + 1), board.position(combos[1] + 1), board.position(combos[2] + 1)].size == 2
            next_move = combos.select{ |space| !board.taken?(space + 1)}.to_i.+(1).to_s
          end
        end

        if next_move == nil
          next_move = [1, 2, 3, 4, 5, 6, 7, 8, 9].detect{ |num| !board.taken?(num)}.to_s
        end

      end
      next_move

    end


  end
end
