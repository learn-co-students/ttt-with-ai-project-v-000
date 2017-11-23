module MiniMax
  def score
    if won?  and winner=="X"
        return 10
    elsif won? and winner=="O"
        return -10
    else
        return 0
    end
  end

  def minimax(board)
    return score if over?
    scores = [] # an array of scores
    moves = []  # an array of moves
    prospective_board=board
    prospective_current=current_player

    # Populate the scores array, recursing as needed
    prospective_board.cells.each_with_index{|m,i| (i+1).to_s if m==" "}.each do |move|
        possible_game = prospective_board.update(move, prospective_current)
        if prospective_current==@player_1
          prospective_current=@player_2
        else
          prospective_current=@player_1
        end
        scores.push minimax(prospective_board)
        moves.push move
    end

    # Do the min or the max calculation
    if current_player.token == "X"
        # This is the max calculation
        max_score_index = scores.each_with_index.max[1]
        return max_score_index.to_s
        #@choice = moves[max_score_index]
        #return scores[max_score_index]
    else
        # This is the min calculation
        min_score_index = scores.each_with_index.min[1]
        return min_score_index.to_s
        #@choice = moves[min_score_index]
        #return scores[min_score_index]
    end
end
end
