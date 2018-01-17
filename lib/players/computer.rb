module Players
  class Computer < Player
    def move(board)
      if self.token == 'X'
        case(board.turn_count)
        when 0
          move = "5"
        when 2
          corners = ["1", "3", "7", "9"]
          move =  corners.delete_if { |corner| board.taken?(corner) }.sample
        when 4
          # Find combo with missing square
          possible_win = Game::WIN_COMBINATIONS.detect do |combo|
            tokens = [
              board.cells[combo[0]], 
              board.cells[combo[1]], 
              board.cells[combo[2]]
            ]
            tokens.count{ |token| token == self.token } > 1 && tokens.include?('O') == false
          end
          
          # Fill the missing square
          if possible_win.nil?
            all_sq = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            move = all_sq.delete_if { |sq| board.taken?(sq) }.sample

          else
            empty_sq = possible_win.detect do |i| 
              board.cells[i] != self.token && board.taken?((i + 1).to_s) == false
            end

            move = (empty_sq + 1).to_s
          end
        end # case_end
      end # if_end
    end # move_end
  end # class_end
end # module_end
