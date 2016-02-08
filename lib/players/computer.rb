class Player::Computer < Player

  def move(board)
    puts "Computer player #{token} moved"
    if !board.taken?("5")
      "5"
    else
      (win(board) || defense(board) || corners(board) || random) +1
    end
  end

  # def board_move(board)
  #    win(board) || defense(board) || corners(board || random
  # end

  def corners(board)
    [0,2,6,8].detect{ |i| !board.taken?(i + 1)} 
  end
      
  def win_combo(board, token)
    # detects and returns first combo array that has 2 token matches in a combo
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

    # win move / winning combo end move
    def win(board)
      winning_combo = win_combo(board, self.token)
      if winning_combo 
        puts "found a combo win #{winning_combo}"
        winning_combo.detect {|i| !board.taken?(i + 1)} 
      end
    end

    # defense move / prevents other player from winning combo moe
    def defense(board)
      defense_move = win_combo(board, self.other_token)
      if defense_move 
        puts "prevent a combo win #{defense_move}"
        defense_move.detect { |i| !board.taken?(i + 1)}

      end
    end

    def other_token
      self.token == "X" ? "O" : "X"
    end


    # random number 1-9, returns string
    def random
      (0..8).to_a.sample
    end

end