require 'pry'

module Players
  class Computer < Player
  
    attr_accessor :original_player
    
    def move(game) 
      @original_player = game.current_player
      minimax(game)
    end 
    
    private
    
    def minimax(game, depth = 0, best_score = {})
      
      if game.won? && (game.current_player != @original_player)
        return (10 - depth) 
      elsif game.won? && (game.current_player == @original_player)
        return (-10 + depth)
      elsif game.draw?
        return 0
      end
      
      game.board.all_available_spaces.each do |space|
        game.board.update(space, game.current_player)
        best_score[space] = minimax(game, depth +=1) 
        reset_space(game, space)
      end
      
      return best_space(best_score) if depth == game.board.all_available_spaces.length 
      
      game.current_player == @original_player ? high_minimax_score(best_score) : low_minimax_score(best_score)
   
    end
      
    def best_space(best_score)
      best_score.max_by {|key, value| value }[0]
    end
    
    def high_minimax_score(best_score)
      best_score.max_by {|key, value| value }[1]
    end
    
    def low_minimax_score(best_score)
      best_score.min_by {|key, value| value }[1]
    end
  
    def reset_space(game, space)
       game.board.reset_space(space)
    end
  end 
end
