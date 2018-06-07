
module Players
  class Computer < Player
    
    def move(board)
      
      # note to self, doing this procedurally is a nightmare - saving as a reminder
      
      PLACES = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
      EDGES = ['2', '4', '6', '8']
      CORNERS = ['1', '3', '7', '9']
    
      if token == 'O'
        enemy = 'X'
      else
        enemy = 'O'
      end
    
      if board.turn_count <= 2 # round 1
        "6" if board.position("6") == ' '
        EDGES.detect { |area| board.position(area) == ' '}
      elsif board.turn_count.between?(3, 4) # round 2
        if board.position("6") == token
          corner_values = CORNERS.collect { |area| board.position(area) }
          if corner_values[1] != enemy && corner_values[2] != enemy
            '3'
          elsif corner_values[0] != enemy && corner_values[3] != enemy
            '1'
          else
            edge_values = EDGES.collect { |area| board.position(area) }
            if edge_values[0] != enemy && edge_values[3] != enemy
              '2'
            elsif edge_values[1] != enemy && edge_values[2] != enemy
              '6'
            end
          end
        else
          # move to make if you started with an edge
        end
      else
        # move five and up
      end
    
    end

    
  end
end