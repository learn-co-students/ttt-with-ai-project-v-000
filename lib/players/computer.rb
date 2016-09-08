module Players
  class Computer < Player
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(1)
        move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}
      else
        Game::WIN_COMBINATIONS.detect do |com|
          if com.select{|i| board.position(i+1) == token}.size == 2 && com.any?{|i| board.position(i+1) == " "}
            move = com.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif com.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && com.any?{|i| board.position(i+1) == " "}
            move = com.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
