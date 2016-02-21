class Computer < Player
  def move(board)
    #return a number from 1-->9
    return @choice || 
  end

  def opponent
    @token == "X" ? @opponent = "O" : @opponent = "X"
  end

  def score(game)
    if game.winner == @token 
      return 10 
    elsif game.winner == @opponent
      return -10
    else
      return 0
    end
  end

  def minimax(game)
    #return a score
    if game.over? 
      return score(game)
    end
    scores = []
    moves = [] 

    if game.current_player == @token
      #find max score
      max_score_index =
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      #find min score
      min_score_index =
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end

  end



end 