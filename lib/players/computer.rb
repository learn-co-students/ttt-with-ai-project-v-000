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
         if !board.taken?(3)
           move = 2
         else
           move = 0
         end

         else Game::WIN_COMBINATIONS.find do |combo|
           if combo.select{|cell| board.cells[cell] == token}.length==2 && combo.select{|cell| board.position(cell) == " "}.length==1
             move = combo.detect{|cell| board.cells[cell] == " "}
          elsif combo.select{|cell| board.cells[cell] != " " && board.cells[cell] != token}.length == 2 && combo.select{|cell| board.cells[cell] == " "}.length==1
            move = combo.detect{|cell| board.cells[cell] == " "}
           end
        end

        if move == nil
          move = [0,2,6,8,1,3,5,7].detect{|cell| board.cells[cell] == " "}
        end

      end
        move = move + 1
        move.to_s
      end

  end
end
