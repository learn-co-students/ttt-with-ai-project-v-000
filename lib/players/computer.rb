require 'pry-byebug'
module Players

  class Computer < Player

    def initialize(token)
      super(token)
    end
    
    def opponent_token(token)
      token == "X" ? "O" : "X"
    end

    def potential_moves(player_token, board)

      enemy_token = opponent_token(player_token)
      
      return (0..board.cells.count).flat_map do |i|
        #If a board cell is empty, mark it as a high score of 5
        if board.cells[i] != " "
          []
        else
          #Iterate over win combinations
          #Mark each cell that is not included in a winning combination as Infinite
          #scores_for_i is an array that includes a score for each cell index. The smaller the score, the 
          scores_for_i = Game::WIN_COMBINATIONS.map do |win_combo| 
            #binding.pry
            if not win_combo.include?(i)
              7
            else 
              score = 0
              combo_cells = board.cells.values_at(*win_combo)
              for cell in combo_cells 
                if cell == enemy_token
                  score = 5
                  break
                else
                  score += cell == " " ? 1 : 0
                end
              end
              score
            end
          end

          min_distance = scores_for_i.min
          opportunity_count = scores_for_i.select { |s| s == min_distance }.count
          cell_index = (i + 1).to_s
        
          [ Move.new(min_distance, opportunity_count, cell_index) ]
        end
      end
    end

    def move(board)
      # Determines whether the next move is to attack or block the opponent
      # Get player token for player and players opponent
      player = self.token
      opponent = opponent_token(player)
      
      # Calculate the best move for the player, if min_distance == 1, play cell_index
      best_move_player = potential_moves(player, board)
      best_move_opponent = potential_moves(opponent, board)

      player_winning_move = best_move_player.detect {|m| m.distance == 1}
      
        if player_winning_move
          player_winning_move.cell_index
        else
          opponent_winning_move = best_move_opponent.detect {|m| m.distance == 1}
        if opponent_winning_move
          opponent_winning_move.cell_index
        else
          best_move_player.max_by {|m| m.opportunity_count}.cell_index
        end
      end
    end

    class Move 

      attr_accessor :distance, :opportunity_count, :cell_index

      def initialize(distance, opportunity_count, cell_index)
        @distance = distance
        @opportunity_count = opportunity_count
        @cell_index = cell_index
      end
    end

  end
end

    
    
  
  
  
 




