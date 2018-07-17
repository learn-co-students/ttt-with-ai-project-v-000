
module Players
  class Computer < Player
    attr_reader :enemy

    def move(board)
      @enemy = token == 'O' ? 'X' : 'O'

      winning_move(board) ||
      block_winning_move(board) ||
      take_center(board) ||
      take_opposite_corner(board) ||
      take_open_corner(board) ||
      take_open_edge(board)
    end

    def winning_move(board)
      find_win_threat(board, token)
    end

    def block_winning_move(board)
      find_win_threat(board, enemy)
    end

    def find_win_threat(board, player_piece)
      critical_move = nil

      Game.win_combinations.each do |combo|
        return "#{critical_move + 1}" if critical_move

        three_connected_spots = [ board.cells[ combo[0] ],
                                  board.cells[ combo[1] ],
                                  board.cells[ combo[2] ] ]

        if three_connected_spots.sort == [' ', player_piece, player_piece]
          three_connected_spots.each_with_index do |spot, index|
            critical_move = combo[index] if spot == ' '
          end
        end
      end

      critical_move
    end

    def take_center(board)
      '5' if !board.taken?('5')
    end

    def take_opposite_corner(board)
      opposite_corners = [ ['1', '9'], ['9', '1'], ['3', '7'], ['7', '3'] ]
      corner_move = nil

      opposite_corners.each do |pair|
        if board.position(pair[0]) == enemy && !board.taken?(pair[1])
          corner_move = pair[1]
        end
      end

      corner_move
    end

    def take_open_corner(board)
      corners = ['1','3','7','9']

      corners.shuffle.detect { |spot| !board.taken?(spot) }
    end

    def take_open_edge(board)
      edges = ['2','4','6','8']

      edges.shuffle.detect { |spot| !board.taken?(spot) }
    end

  end
end
