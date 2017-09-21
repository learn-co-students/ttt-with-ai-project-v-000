module Players
  
  class Computer < Player
    
    def move(board)
      move = false || nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{ |q| !board.taken?(q)}
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"
      else
        Game::WIN_COMBINATIONS.detect do |w|
          if w.select{ |q| board.position(q + 1) != " " && board.position(q + 1) != token}.size == 2 && w.any?{ |q| board.position(q + 1) == " "}
            move = w.select{ |q| !board.taken?(q + 1)}.first.to_i.+(1)
          elsif w.select{ |q| board.position(q + 1) == token}.size == 2 && w.any?{ |q| board.position(q + 1) == " "}
            move = w.select{ |q| !board.taken?(q + 1)}.first.to_i.+(1)
          end
        end
          move = [1, 3, 7, 9, 2, 4, 6, 8].detect{ |q| !board.taken?(q)} if !(move) 
      end
        move
    end
  end
  
end