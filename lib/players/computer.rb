require 'pry'
module Players
  class Computer < Player

    def move(board)
      @move = nil
        if board.turn_count == 0 #if turn is 1 take corner uper left
          @move = "1"
        elsif board.turn_count == 1
          @move = "5"
        #end turn 2 logic
        elsif board.turn_count == 2 && !board.taken?(5) #if turn count = 3 if went first and center is still avalible take it
          @move = "5"
        elsif board.turn_count == 2 #if went first and lower right corner is valaible take it
          @move = "9"
        else
          Game::WIN_COMBINATIONS.detect do |cmb|

          # Win if can known bug wont win on the first chance donno why
          if cmb.select{|i| board.position(i+1) == @token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            @move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            return @move
          # Block
        elsif cmb.select{|i| board.position(i+1) != " " && board.position(i+1) != @token}.size == 2 && cmb.any?{|i| board.position(i+1) == " "}
            @move = cmb.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
            return @move
          end
        end

        #anything else
                @move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if @move == nil
              end
              @move
            end
          end
        end
