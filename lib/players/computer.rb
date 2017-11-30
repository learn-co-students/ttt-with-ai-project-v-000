module Players
  class Computer < Player
    def move(board)
      # move = rand(1..9)

      if !board.taken?(5)
        move = 5

      elsif !board.taken?(1)
          move = 1

      elsif !board.taken?(3)
          move = 3

      elsif !board.taken?(7)
          move = 7

      elsif !board.taken?(9)
          move = 9

      else
        move = rand(1..9)
      #    Game::WIN_COMBINATIONS.detect do |combo|
      #        if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
      #          move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1)
      #        else
      #          move = [1..9].detect{|i| !board.taken?(i)}.to_i
      #
      #        end
      #        move
      #    end
      #
      end
    end
  end
end
