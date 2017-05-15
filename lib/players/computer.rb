module Players
  class Computer < Player

    def move(board)
      move = ""
      zelf = self.token
      if zelf == "X"
        opp = "O"
      else
        opp = "X"
      end

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect{|pos| !board.taken?(pos)}.to_s
      elsif board.turn_count == 3 && (board.position(1) == opp && board.position(9) == opp || board.position(3) == opp && board.position(7) == opp)
        move = "8"
      elsif
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|index| board.position(index + 1) == zelf}.size == 2 && combo.any?{|index| board.position(index + 1) == " "}
            move = combo.select{|index| !board.taken?(index + 1)}.first.to_i.+(1).to_s
          elsif combo.select{|index| board.position(index + 1) != " " && board.position(index + 1) == opp}.size == 2 && combo.any?{|index| board.position(index + 1) == " "}
            move = combo.select{|index| !board.taken?(index + 1)}.first.to_i.+(1).to_s
          end
        end
      else
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|index| !board.taken?(index)}.to_s
      end
      move
    end

  end
end
