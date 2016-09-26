module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|index| !board.taken?(index)}.to_s

      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      else
        Game::WIN_COMBINATIONS.detect do |combo|

          if combo.select{|index| board.position(index+1) == token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
            move = combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s

          elsif combo.select{|index| board.position(index+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|index| board.position(index+1) == " "}
            move = combo.select{|index| !board.taken?(index+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|index| !board.taken?(index)}.to_s if move == nil
      end
      move
    end
  end
end
