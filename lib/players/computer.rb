
module Players
  class Computer < Player

    def win_or_block(board)
      if board.turn_count.between?(2, 7)
        wob_move = nil

        Game.win_combinations.each do |set|
          return wob_move if wob_move

          trio = [board.cells[set[0]], board.cells[set[1]], board.cells[set[2]]]

          if trio.sort == [' ', 'X', 'X'] || trio.sort == [' ', 'O', 'O']
            trio.each_with_index do |area, index|
              if area == ' '
                wob_move = "#{set[index] + 1}"
              end
            end
          end
        end

        wob_move
      end
    end

    def counter_corner(board)
      opposite_corners = [ ['1', '9'], ['9', '1'], ['3', '7'], ['7', '3'] ]
      enemy = token == 'O' ? 'X' : 'O'
      corner_move = nil

      opposite_corners.each do |pair|
        if board.position(pair[0]) == enemy && !board.taken?(pair[1])
          corner_move = pair[1]
        end
      end

      corner_move
    end

    def corners_or_edges(board)
      corners = ['1','3','7','9']
      edges = ['2','4','6','8']

      corners.shuffle.detect do |spot| !board.taken?(spot) end ||
      edges.shuffle.detect do |space| !board.taken?(space) end
    end

    def move(board)
      win_or_block(board) || if !board.taken?('5') then '5' end ||
      counter_corner(board) || corners_or_edges(board)
    end

  end
end
