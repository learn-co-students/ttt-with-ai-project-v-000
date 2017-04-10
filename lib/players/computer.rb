module Players

  class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 8
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
  end

  class Computer < Player

    attr_reader :board, :game
    attr_accessor :x_player_index, :o_player_index

    def initialize(token)
      super(token)
    end

    def opponent_token
      self.player.token == "X" ? "O" : "X"
    end

    def best_move
      # Returns the number of winning opportunites for each board cell.
      # Depends on 'min_distance' i.e. how many steps each cell is from a win, and
      # How many different routes, 'opportunity_count' can be taken a given cell that can provide a win
      # Smaller distance, less routes is better than many routes with equal distances.
  
      board.cells.map do |i|
        #Integer::Max == Infinity
        return Integer::MAX if board.cells[i] != ' '

        scores_for_i = Game::WIN_COMBINATIONS.map do |win_combo| 
          return Integer::MAX if not win_combo.include?(i)
   
          score = 0
          combo_cells = board.cells.values_at(*win_combo)
          for cell in combo_cells
            return Integer::MAX if cell == opponent_token
            score += cell == ' ' ? 1 : 0
          end
          score
        end

        min_distance = scores_for_i.min
        opportunity_count = scores_for_i.filter { |s| s == min_distance }.count
        cell_index = i
       
        return Move.new(min_distance, opportunity_count, cell_index)
      end
    end

    def game_tactic
      # Determines whether the next move is to attack or block the opponent
      if best_move
    end

    def move(board)
      game_tactic
    end


      
    class Move 

      attr_accessor :distance, :opportunity_count

      def initialize(distance, opportunity_count, cell_index)
        @distance = distance
        @opportunity_count = opportunity_count
        @cell_index = cell_index
      end
    end

end

    
    


  
  
  
 




