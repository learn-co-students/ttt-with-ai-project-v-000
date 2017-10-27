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
         #this needs an end keyword, and perhaps another turn_count = 3 method
       end
        Game::WIN_COMBINATIONS.detect do |combo|
        if (combo.select{|cell| board.cells[cell - 1] == token}.length==2)
          combo.detect do |cell|
            if board.position(cell) != token
              move = cell
            end
          end
        end
      end
      #binding.pry # End of the Game::WIN_COMBO iteration, if we are occupying two spaces
      move
    end


  end
end
