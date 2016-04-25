class Computer < Player
  def move(board)
    if !board.taken?('5')#If middle isn't taken
      '5'#take middle (cell[5-1])
    else
      best_move(board) + 1 #select the best move
      #Add 1 to offset index value returned by best_move(board)
    end
  end

  def best_move(board)
    win(board) || block(board) || corner(board) || random
    #Go for Win or Block a win or Select a Corner or Random
    #in order of prefrence
  end

  def corner(board)
    [0,2,6,8].detect{|cell| !board.taken?(cell+1)}
    #find the first corner that isnt taken and move
    #Add 1 because taken? method refers to string, not index
    #index = cell, cell + 1 = string
  end

  def complete_combo?(board, token)
    #check if win combo is near completion
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

  def win(board)
    # puts "...checking for win for #{token} on #{board.cells}"

    winning_combo = complete_combo?(board, self.token)
    if winning_combo && winning_combo.count{|index| board.position(index+1) == self.token} == 2
      puts "...found winning combo #{winning_combo}"
      winning_combo.detect{|index| !board.taken?(index+1)}
    #check if computer combo is near completion
    #Win (fill remaining index with self.token
    end
  end

  def block(board)
    # puts "...checking for block for #{token} on #{board.cells}"

    blocking_combo = complete_combo?(board, self.opponent_token)
    if blocking_combo && blocking_combo.count{|index| board.position(index+1) == self.opponent_token} == 2
      puts "...found blocking combo #{blocking_combo}"
      blocking_combo.detect{|index| !board.taken?(index+1)}
    #check if an opponent combo is near completion
    #Block (fill remaining index with self.token)
    end
  end

  def opponent_token
    self.token == "X" ? "O" : "X"
    # determine opponent's token and set computer token to opposite
  end

  def random 
    (0..8).to_a.sample
    #make an array of 0-8, and sample(random)
  end
end