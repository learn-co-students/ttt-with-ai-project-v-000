class Player::Computer < Player

  POS_RANK = {4=>4,0=>3,2=>3,6=>3,8=>3,1=>2,3=>2,5=>2,7=>2} #Rank of board position
  def move(board)
    puts "Computer #{@token}'s turn"
    win(board) || block_opponent(board) || best_by_rank(board)
  end

  def block_opponent(board) #returns blocking move if opponent has two tokens in winning position, nil if not needed
    important = remove_full_winners(board).inject({}) do |result,combo|
      result[combo] = combo.reduce(0){|count,i| (board.cells[i] != @token && board.cells[i] != " ") ? count += 1 : count }
      result
    end
    important.key(2).find{|i| board.open_spaces.include?(i)}.+(1).to_s if important.key(2)

  end
  def best_by_rank(board) #returns the higest ranked position from the available moves
    board.open_spaces.reduce{|hi,low| POS_RANK[hi] > POS_RANK[low] ? hi : low}.+(1).to_s
  end

  def remove_full_winners(board) #removes win combinations if full
    Game::WIN_COMBINATIONS.select{|i| i.any?{|num| board.cells[num]==" "}}
  end

  def win(board) #returns a winnable play by making a hash of valid combos and how many positions the current player occupies
    important = remove_full_winners(board).inject({}) do |result,combo|
      result[combo] = combo.reduce(0){|count,i| (board.cells[i] == @token) ? count += 1 : count }
      result
    end
    important.key(2).find{|i| board.open_spaces.include?(i)}.+(1).to_s if important.key(2) 
  end

end
