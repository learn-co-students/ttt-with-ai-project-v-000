module Players
  class Computer < Player
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif board.turn_count == 1
        move = "1"
      elsif board.turn_count == 2
        move = [1, 3, 7, 9].detect {|m| !taken?(m)}
      elsif board.turn_count == 3 && (board.position(1) == board.position(7) || board.position(3) == board.position(9))
        move = "2"
      else
        Game::WIN_COMBINATIONS.detect do |wc|
          if wc.select {|i| board.position(i+1) == token}.size == 2 && wc.any? {|i| board.postion(i+1) == " "}
            move = wc.select {|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif wc.select {|i| board.postion(i+1) != " " && board.postion(i+1) != token}.size == 2 && wc.any? {|i| board.position(i+1) == " "}
            move = wc.select {|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1,3,7,9,2,4,6,8].detect {|i| !board.taken?(i+1)}.to_s if move = nil
      end
    move  
    end
  end
end
