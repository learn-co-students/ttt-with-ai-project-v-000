class Computer < Player
  def move(board)
    (rand(9) + 1).to_s
  end
  
  def minmax(board, current_player)
    binding.pry
    return score board if game.over? board
      scores = {}

      board.available_spaces.each do |space|

    
      pot_board = board.dup

    
      pot_board.place_piece space, current_player

    
      scores[index] = minmax(pot_board, switch(current_player))
    end

    @best_choice, best_score = best_move current_player, scores

      puts best_score
    end
  
  end