module Players
  class Computer < Player

    def move(board)
      move = nil

      if board.turn_count == 0
        move = 4

      elsif board.turn_count == 1
         if !board.taken?(5)
           move = 4
         else
           move = 0
         end

       elsif board.turn_count == 2
         if !board.taken?(2)
           move = 1
         else
           move = 3
         end

       else Game::WIN_COMBINATIONS.find do |combo|

           if combo.select{|cell| board.cells[cell] == token}.length==2
             move = combo.detect{|cell| board.cells[cell] == " "}
           end

           if combo.select{|cell| board.cells[cell] != " " }.length==2 || combo.select{|cell| board.cells[cell] != token}.length==2
             move = combo.detect{|cell| board.cells[cell] == " "}
           end

          end
        end
        move + 1
        move.to_s
      end

  end
end
