module Players
  class Computer < Player
    def move(board)

      move = nil
      if !board.taken?(5)
        move = 5.to_s

      elsif board.turn_count < 3
        move = [1, 3, 7, 9].select{|i| !board.taken?(i)}.sample.to_s

      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == self.token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != self.token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move

    end
  end
end
