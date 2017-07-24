module Players

  class Computer < Player

    def move(board)
      move = nil

      # if !board.taken?(7)
      #   move = "7"
      #
      # elsif board.turn_count == 1
      #   move = "5"
      #
      # elsif board.turn_count == 2
      #   move = "3"
      #
      # elsif board.turn_count == 3 && (board.position(1) == board.position(9))
      #   move = "8"
      #
      # elsif board.turn_count == 3 && (board.position(3) == board.position(7))
      #   move = "2"
      #
      # else
      #
      #   Game::WIN_COMBINATIONS.detect do |win_combination|
      #
      #   if win_combination.select{|i| board.position(i+1) == token}.size == 2 && win_combination.any?{|i| board.position(i+1) == " "}
      #     move = win_combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s
      #   end
      #
      #   end

      if !board.taken?(7)
            move = "7"

      elsif board.turn_count == 1
            move = "5"

      elsif board.turn_count == 2
            move = [1, 3, 9].detect{|i| !board.taken?(i)}.to_s

      elsif board.turn_count == 3 && (board.position(1) == board.position(9) || board.position(3) == board.position(7))
            move = "2"

      else
            Game::WIN_COMBINATIONS.detect do |win_combination|

                if win_combination.select{|i| board.position(i+1) == token}.length == 2 && win_combination.any?{|i| board.position(i+1) == nil}
                   move = win_combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

                elsif win_combination.select{|i| board.position(i+1) != nil && board.position(i+1) != token}.length == 2 && win_combination.any?{|i| board.position(i+1) == " "}
                   move = win_combination.select{|i| !board.taken?(i+1)}.first.to_i.+(1).to_s

                end
            end
                move = [1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i)}.to_s if move == nil
        end

        move

      end


    end


  end
