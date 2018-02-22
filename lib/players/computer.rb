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

    def move(board)
      win(board)
      block(board)
      if board.cells[4] == " "
        "4"
      block = WIN_COMBINATIONS.detect do |combo|
                board.cells[combo[0]] == board.cells[combo[1]] ||
                board.cells[combo[1]] == board.cells[combo[2]] &&
                board.taken?(combo[0] + 1) && board.cells[combo[0]] != current_player.token
              end
      if block


    end

    def block
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
        nil
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
        nil
      end
    end
end
