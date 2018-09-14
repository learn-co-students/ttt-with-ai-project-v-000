module Players

  class Computer < Player

    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif board.turn_count == 1
        move = "1"

      elsif board.turn_count == 2
        move = [1,3,7,9].find do |position|
          !board.taken?(position).to_s
        end

      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
        move = "2"

      else
        Game.WIN_COMBINATIONS.find do |combo|

          if combo.find_all {|p| board.position(p+1) == token}.size == 2 && combo.any? {|p| board.position(p+1)== " "}
            move = combo.find {|p| !board.taken?(p+1)}.first.to_i+(1).to_s

          elsif combo.find_all {|p| board.position(p+1) != token}.size == 2 && combo.any? {|p| board.position(p+1)== " "}
            move = combo.find {|p| !board.taken?(p+1)}.first.to_i+(1).to_s

          end
        end

        move = [1, 3, 7, 9, 2, 4, 6, 8].find{|i| !board.taken?(i)}.to_s if move == nil

      end
      move
    end 

  end

end
