module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        [1, 3, 7, 9].delete_if {|index| board.taken?(index) == true}.first
      else
        Game::WIN_COMBINATIONS.each do |combo|

          if combo.select { |index| board.taken?(index + 1) && board.cells[index] == self.token}.size == 2 #win first
            taken_positions = combo.select { |index| board.taken?(index + 1) && board.cells[index] == self.token}
            #binding.pry
            move = (((combo - taken_positions).first) + 1).to_s
              if board.taken?(move)
                move = nil
              end

          elsif combo.select { |index| board.taken?(index + 1) && board.cells[index] != " " && board.cells[index] != self.token}.size == 2 #block second
            taken_positions = combo.select { |index| board.taken?(index + 1) && board.cells[index] != self.token}
            #binding.pry
            move = (((combo - taken_positions).first) + 1).to_s
              if board.taken?(move)
                move = nil
              end
          end #winner and blocker end
        end
      end#if board.taken
      if move.nil?
        move = ((board.available_moves.first) + 1).to_s
      else 
        move
      end #if move.nil?
    end #move
  end #class
end #module
