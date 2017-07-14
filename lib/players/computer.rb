module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "3"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|cell| !board.taken?(cell)}.to_s
      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select {|cell| board.position(cell+1) == token}.size == 2 &&
            combo.any? { |cell| board.position(cell + 1) == " "}
            move = combo.detect { |cell| !board.taken?(cell+1)}.to_i.+(1).to_s
          elsif combo.select {|cell| board.position(cell+1) != token && board.position(cell+1) != " "}.size == 2 &&
            combo.any? { |cell| board.position(cell + 1) == " "}
            move = combo.detect { |cell| !board.taken?(cell+1)}.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect {|cell| !board.taken?(cell)}.to_s if move == nil
        end
        move
    end
  end
end
