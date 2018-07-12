=begin
  - make center a method again, called take_center
  - split corners_or_edges into different methods, named take_open_corner or take_open_edge
  - split win_or_block into seperate methods, winning_move and blocking_move
=end

module Players
  class Computer < Player
    attr_reader :enemy

    def move(board)
      @enemy = token == 'O' ? 'X' : 'O'

      win_or_block(board) ||
      center(board) ||
      counter_corner(board) ||
      corners_or_edges(board)
    end

    def win_or_block(board)
      wob_move = nil

      Game.win_combinations.each do |set|
        return wob_move if wob_move

        trio = [ board.cells[ set[0] ], board.cells[ set[1] ],
        board.cells[ set[2] ] ]

        if trio.sort == [' ', token, token] || trio.sort == [' ', enemy, enemy]
          trio.each_with_index do |area, index|
            if area == ' '
              wob_move = "#{set[index] + 1}"
            end
          end
        end
      end

      wob_move
    end

    def center(board)
      '5' if !board.taken?('5')
    end

    def counter_corner(board)
      opposite_corners = [ ['1', '9'], ['9', '1'], ['3', '7'], ['7', '3'] ]
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

      corners.shuffle.detect do |spot|
        !board.taken?(spot)
      end ||
      edges.shuffle.detect do |space|
        !board.taken?(space)
      end
    end

  end
end
