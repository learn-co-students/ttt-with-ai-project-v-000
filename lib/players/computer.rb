#module Players
#  class Computer < Player
#
#    def move(board)
#      reply = rand(1-9).to_s
#      if board.valid_move?(reply)
#        reply
#      elsif board.valid_move?(reply)
#        "invalid"
#      elsif board.taken?(1) && board.taken?(2)
#        "3"
#      elsif board.taken?(4) && board.taken?(5)
#        "6"
#      elsif board.taken?(7) && board.taken?(8)
#        "9"
#      elsif board.taken?(4) && board.taken?(5)
#        "5"
#      end
#    end
#  end
#end

module Players
  class Computer < Player
    def move(board)
      move = nil
      if !board.taken?(5)
        move = "5"
      elsif !board.taken?(1)
        move = [1, 3, 7, 9].detect{|index| !board.taken?(index)}

      else
        Game::WIN_COMBINATIONS.detect do |combo|
          if combo.select{|i| board.position(i+1) == token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          elsif combo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && combo.any?{|i| board.position(i+1) == " "}
            move = combo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end
        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end
