
module Players
  class Computer < Player
    
    def move(board)
      corners = ['1','3','7','9']
      edges = ['2','4','6','8']
    
      if token == 'O'
        enemy = 'X'
      else
        enemy = 'O'
      end
    
      urgent_move = [false, '0']
      Game.win_combinations.each { |set|
        if board.cells[set[0]] != ' ' && board.cells[set[0]] == board.cells[set[1]] && board.cells[set[2]] == ' '
          urgent_move = [true, set[2].to_s]
        elsif board.cells[set[1]] != ' ' && board.cells[set[1]] == board.cells[set[2]] && board.cells[set[0]] == ' '
          urgent_move = [true, set[0].to_s]
        end
      }
    
      if urgent_move[0] # win / block - use Game.win_combinations for conditional logic
        urgent_move[1]
      # elsif # (block)fork - this one may require a giant array of adjacent spots
      elsif board.position('6') == ' ' # center
        '6'
      elsif board.position('1') == enemy && board.position('9') == ' ' # opposite corner 1
        '9'
      elsif board.position('3') == enemy && board.position('7') == ' ' # opposite corner 3
        '7'
      elsif board.position('7') == enemy && board.position('3') == ' ' # opposite corner 7
        '3'
      elsif board.position('9') == enemy && board.position('1') == ' ' # opposite corner 9
        '1'
      else # corner / edge
        corners.detect { |area| board.position(area) == ' '} || edges.detect { |area| board.position(area) == ' '}
      end
    end
    
  end
end