
module Players
  class Computer < Player
    attr_reader :urgent_move, :corner_move
    
    def win_or_block?(board)
      Game.win_combinations.any? { |set|
        if board.cells[set[0]] != ' ' && board.cells[set[0]] == board.cells[set[1]] && board.cells[set[2]] == ' '
          @urgent_move = "#{set[2] + 1}"
          true
        elsif board.cells[set[1]] != ' ' && board.cells[set[1]] == board.cells[set[2]] && board.cells[set[0]] == ' '
          @urgent_move = "#{set[0] + 1}"
          true
        elsif board.cells[set[2]] != ' ' && board.cells[set[2]] == board.cells[set[0]] && board.cells[set[1]] == ' '
          @urgent_move = "#{set[1] + 1}"
          true
        end
      }
    end
    
    def fork_found?(board)
      dupe = board
      board.cells.each_with_index { |cell, index|
        if cell == ' '
          dupe.cells[index] = 'X'
          if win_or_block?(dupe)
            @fork_move = "#{index + 1}"
            break
          else
            dupe.cells[index] = 'O'
            if win_or_block?(tester)
              @fork_move = "#{index + 1}"
              break
            else
              dupe.cells[index] = ' '
            end
          end
        end
      }
      fork_move ? true : false
    end
    
    def counter_corner?(board)
      enemy = token == 'O' ? 'X' : 'O'
      
      if board.position('1') == enemy && board.position('9') == ' '
        @corner_move = '9'
        true
      elsif board.position('9') == enemy && board.position('1') == ' '
        @corner_move = '1'
        true
      elsif board.position('3') == enemy && board.position('7') == ' '
        @corner_move = '7'
        true
      elsif board.position('7') == enemy && board.position('3') == ' '
        @corner_move = '3'
        true
      end
      false
    end
    
    def move(board)
      corners = ['1','3','7','9']
      edges = ['2','4','6','8']
    
      if win_or_block?(board)
        urgent_move
      elsif board.position('5') == ' ' # center
        '5'
      elsif counter_corner?(board)
        corner_move
      else
        corners.detect { |area| board.position(area) == ' ' } || edges.detect { |area| board.position(area) == ' ' }
      end
    end
    
  end
end