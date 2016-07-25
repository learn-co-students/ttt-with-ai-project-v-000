class Players
  class Computer < Player
    attr_accessor :board

    def move(board)
      @board = board
      if !board.taken?("5")
        "5"
      else
        best_move(board)
      end
    end

    def opponent_token
      token == "X" ? "O" : "X"
    end


    def corner_move(board)
      [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
    end

    def best_move(board)
      win(board) || block(board) || corner_move(board) || random
    end

    def random
      number = rand 0..8
      number.to_s
    end

    def has_combination?(board, token)#returns first combo
      Game::WIN_COMBINATIONS.detect do |combo|
        (
          (board.cells[combo[0]] == token && board.cells[combo[1]] == token) &&
          !board.taken?(combo[2]+1)
        ) ||
        (
          (board.cells[combo[1]] == token && board.cells[combo[2]] == token) &&
          !board.taken?(combo[0]+1)
        ) ||
        (
          (board.cells[combo[0]] == token && board.cells[combo[2]] == token) &&
          !board.taken?(combo[1]+1)
        )
      end
    end

    def block(board) # blocks when opponent has 2 out of 3
      block_combo = has_combination?(board, opponent_token)
      if block_combo && block_combo.count{|index| board.position(index+1)== opponent_token} == 2
        block_combo.detect {|index| !board.taken?(index+1)}
      end
    end

    def win(board)
      win_combo = has_combination?(board, token)
      if win_combo && win_combo.count{|index| board.position(index+1) == token} == 2
        win_combo.detect {|index| !board.taken?(index+1)}
      end
    end

  end
end
