
module Players
  class Computer < Player

    def win_or_block(board)
      if board.turn_count.between?(2, 7)
        move = nil
        Game.win_combinations.each { |set|
          if board.cells[set[0]] != ' ' &&
             board.cells[set[0]] == board.cells[set[1]] &&
             board.cells[set[2]] == ' '
            move = "#{set[2] + 1}"
            break
          elsif board.cells[set[1]] != ' ' &&
                board.cells[set[1]] == board.cells[set[2]] &&
                board.cells[set[0]] == ' '
            move = "#{set[0] + 1}"
            break
          elsif board.cells[set[2]] != ' ' &&
                board.cells[set[2]] == board.cells[set[0]] &&
                board.cells[set[1]] == ' '
            move = "#{set[1] + 1}"
            break
          end
        }
        move
      end
    end

    def counter_corner(board)
      enemy = token == 'O' ? 'X' : 'O'
      if board.position('1') == enemy &&
         board.position('9') == ' '
        '9'
      elsif board.position('9') == enemy &&
            board.position('1') == ' '
        '1'
      elsif board.position('3') == enemy &&
            board.position('7') == ' '
        '7'
      elsif board.position('7') == enemy &&
            board.position('3') == ' '
        '3'
      end
    end

    def center(board)
      '5' if board.position('5') == ' '
    end

    def corners_or_edges(board)
      corners = ['1','3','7','9']
      edges = ['2','4','6','8']

      corners.shuffle.detect { |area|
        board.position(area) == ' '
      } || edges.shuffle.detect { |area|
        board.position(area) == ' '
      }
    end

    def move(board)
      win_or_block(board) || center(board) || counter_corner(board) ||
      corners_or_edges(board)
    end

  end
end
