module Players
  class Computer < Player

    def move(board)
      move = nil

      if board.turn_count == 0

        move = "5"

      elsif board.turn_count == 1

         if !board.taken?(5)
           move = "5"
         else
           move = "1"
         end
       elsif board.turn_count == 2
         if !board.taken?(2)
           move = 2
         else
           move = 4
         end
       else Game::WIN_COMBINATIONS.find do |combo|
          binding.pry
           if combo.select{|cell| board.cells[cell] == token}.length==2 || combo.select{|cell| board.cells[cell] != " "}.length==2
            binding.pry
             move = combo.detect{|cell| board.cells[cell] == " "}
            end
          end
        end
        binding.pry
        move
      end




  end
end
