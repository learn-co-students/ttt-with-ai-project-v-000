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
      #elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
      #  move = "2"
      else
        Game::WIN_COMBINATIONS.detect do |cmbo|

          if cmbo.select {|i| board.position(i+1) == token}.size == 2 && cmbo.any?{|i| board.position(i+1) == " "}
            move = cmbo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

          elsif cmbo.select{|i| board.position(i+1) != " " && board.position(i+1) != token}.size == 2 && cmbo.any?{|i| board.position(i+1)==" "}
            move = cmbo.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
          end
        end

        move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
      end
      move
    end
  end
end

#this code always leads to tie when 0 player game
#if !board.taken?(5)
#  move = "5"
#elsif board.turn_count == 1
#  move = "1"
#elsif board.turn_count == 2
#  move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 3
#  move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 4
#  move = [1, 3, 7, 9].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 5
#  move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 6
#  move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 7
#  move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
#elsif board.turn_count == 8
#  move = [2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s
#end
