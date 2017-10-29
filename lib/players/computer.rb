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
         #binding.pry
       elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
         move = 1
         else Game::WIN_COMBINATIONS.find do |combo|
           if combo.select{|cell| board.cells[cell] == token}.length==2 && combo.select{|cell| board.position(cell) == " "}.length==1
             move = combo.detect{|cell| board.cells[cell] == " "}
          elsif combo.select{|cell| board.cells[cell] != " " && board.cells[cell] != token}.length == 2 && combo.select{|cell| board.cells[cell] == " "}.length==1
            move = combo.detect{|cell| board.cells[cell] == " "}
           end
        end

        if move == nil
          if board.cells[0] && board.cells[7] != " " && board.position(1) == board.position(8)  && !board.taken?(7)
            move = 6
          elsif board.cells[2] && board.cells[7] != " " && board.position(3) == board.position(8) && !board.taken?(9)
            move = 8
          elsif board.cells[1] && board.cells[8] != " " && board.position(2) == board.position(9) && !board.taken?(3)
            move = 2
          elsif board.cells[1] && board.cells[6] != " " && board.position(2) == board.position(7) && !board.taken?(1)
            move = 0
          elsif board.cells[2] && board.cells[4] != " " && board.position(3) == board.position(4) && !board.taken?(1)
            move = 0
          elsif board.cells[3] && board.cells[8] != " " && board.position(4) == board.position(9) && !board.taken?(7)
            move = 6
          elsif board.cells[0] && board.cells[5] != " " && board.position(1) == board.position(6) && !board.taken?(3)
            move = 2
          elsif board.cells[5] && board.cells[6] != " " && board.position(6) == board.position(7) && !board.taken?(9)
            move = 8
          elsif board.cells[1] && board.cells[5] != " " && board.position(2) == board.position(6) && !board.taken?(3)
            move = 2
          elsif board.cells[1] && board.cells[3] != " " && board.position(2) == board.position(4) && !board.taken?(1)
            move = 0
          elsif board.cells[3] && board.cells[7] != " " && board.position(4) == board.position(8) && !board.taken?(7)
            move = 6
          elsif board.cells[7] && board.cells[5] != " " && board.position(8) == board.position(6) && !board.taken?(9)
            move = 8
          else
          move = [0,1,2,3,4,5,6,7,8].detect{|cell| board.cells[cell] == " "}
        end
      end

      end
        move = move + 1
        move.to_s
      end

  end
end
