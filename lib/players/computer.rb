module Players
  class Computer < Player
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]
    ]

    BIFURCATE_COMBINATIONS = [
      [0,1,3],
      [1,2,5],
      [3,6,7],
      [7,5,8],
      [0,4,6],
      [2,4,8],
      [0,4,2],
      [6,4,8],
      [0,2,8],
      [2,8,6],
      [8,6,0],
      [6,0,2]
    ]

    def move(board = Board.new)
      if win(board)
        return win(board)
      elsif block(board)
        return block(board)
      elsif bifurcate(board)
        return bifurcate(board)
      elsif block_bifurcate(board)
        return block_bifurcate(board)
      elsif center(board)
        return center(board)
      elsif opposite_corner(board)
        return opposite_corner(board)
      elsif corner(board)
        return corner(board)
      else
        side(board)
      end
    end

    def center(board)
      board.taken?(5) ? false : "5"
    end

    def opposite_corner(board)
      if board.cell[0] != current_player.token && !board.taken?(9)
        "9"
      elsif board.cell[2] != current_player.token && !board.taken?(7)
        "7"
      elsif board.cell[6] != current_player.token && !board.taken?(3)
        "3"
      elsif board.cell[8] != current_player.token && !board.taken?(1)
        "1"
      else
        false
      end
    end

    def corner(board)
      if !board.taken?(1)
        "1"
      elsif !board.taken?(3)
        "3"
      elsif !board.taken?(7)
        "7"
      elsif !board.taken?(9)
        "9"
      end
    end

    def side(board)
      if !board.taken?(2)
        "2"
      elsif !board.taken?(4)
        "4"
      elsif !board.taken?(6)
        "6"
      elsif !board.taken?(8)
        "8"
      end
    end

    def bifurcate(board)
      bifurcate = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[0]] == board.cells[combo[1]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] = current_player.token
              end
      bifurcate2 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[1]] == board.cells[combo[2]] &&
                board.taken?(combo[1] + 1) &&
                board.cells[combo[1]] = current_player.token
              end
      bifurcate3 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[2]] == board.cells[combo[0]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] = current_player.token
              end
      if bifurcate
        bifurcate[2] + 1
      elsif bifurcate2
        bifurcate[0] + 1
      elsif bifurcate3
        bifurcate[1] + 1
      else
        false
      end
    end

    def block_bifurcate(board)
      block_bifurcate = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[0]] == board.cells[combo[1]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] != current_player.token
              end
      block_bifurcate2 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[1]] == board.cells[combo[2]] &&
                board.taken?(combo[1] + 1) &&
                board.cells[combo[1]] != current_player.token
              end
      block_bifurcate3 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[2]] == board.cells[combo[0]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] != current_player.token
              end
      if block_bifurcate
        block_bifurcate[2] + 1
      elsif block_bifurcate2
        block_bifurcate[0] + 1
      elsif block_bifurcate3
        block_bifurcate[1] + 1
      else
        false
      end
    end

    def block(board)
      block = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[0]] == board.cells[combo[1]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] != current_player.token
              end
      block2 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[1]] == board.cells[combo[2]] &&
                board.taken?(combo[1] + 1) &&
                board.cells[combo[1]] != current_player.token
              end
      block3 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[2]] == board.cells[combo[0]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] != current_player.token
              end
      if block
        block[2] + 1
      elsif block2
        block[0] + 1
      elsif block3
        block[1] + 1
      else
        false
      end
    end

    def win(board)
      winner = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[0]] == board.cells[combo[1]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] = current_player.token
              end
      winner2 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[1]] == board.cells[combo[2]] &&
                board.taken?(combo[1] + 1) &&
                board.cells[combo[1]] = current_player.token
              end
      winner3 = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[2]] == board.cells[combo[0]] &&
                board.taken?(combo[0] + 1) &&
                board.cells[combo[0]] = current_player.token
              end
      if winner
        winner[2] + 1
      elsif winner2
        winner[0] + 1
      elsif winner3
        winner[1] + 1
      else
        false
      end
    end
  end
end
