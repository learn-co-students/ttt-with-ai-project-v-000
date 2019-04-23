module Players
  class Computer < Player
    def move(board)
      move = nil
      
      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s

      else
        Game::WIN_COMBINATIONS.detect do |win_combo|

          if win_combo.select{|i| board.position(i+1) == token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
            move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          elsif win_combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && win_combo.any?{|i| board.position(i+1) == " "}
            move = win_combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end