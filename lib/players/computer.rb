module Players
  class Computer < Player

    def move(board)
      if board.turn_count == 0
        "1"
      elsif board.turn_count == 1
        if !board.taken?(5)
          "5"
        elsif board.taken?(5)
          corners(board)
        end
      elsif board.turn_count == 2
        "9" unless board.taken?(9)
        corners(board)
      elsif board.turn_count == 3
      #   if board.taken?(1) && board.taken?(5)
      #     "9"
      #   elsif board.taken?(2) && board.taken?(5)
      #     "8"
      #   elsif board.taken?(3) && board.taken?(5)
      #     "7"
      #   elsif board.taken?(4) && board.taken?(5)
      #     "6"
        # if board.taken?(6) && board.taken?(5)
        #   "4"
        # elsif board.taken?(7) && board.taken?(5)
        #    "3"
        # elsif board.taken?(8) && board.taken?(5)
        #    "2"
        # elsif board.taken?(9) && board.taken?(5)
        #    "1"
        # else
          edges(board)
        # end
      elsif board.turn_count == 4
        if board.taken?(2) && board.taken?(5) && !board.taken?(8)
          "8"
        elsif board.taken?(8) && board.taken?(5) && !board.taken?(2)
          "2"
        elsif board.taken?(4) && board.taken?(5) && !board.taken?(6)
          "6"
        elsif board.taken?(6) && board.taken?(5) && !board.taken?(4)
          "4"
        elsif board.taken?(3) && board.taken?(5) && !board.taken?(7)
          "7"
        # elsif board.taken?(2) && board.taken?(1)
        #   "3"
        # elsif board.taken?(4) && board.taken?(1)
        #   "7"
        # elsif board.taken?(6) && board.taken?(9)
        #   "3"
        # elsif board.taken?(8) && board.taken?(9)
        #   "7"
        # elsif board.taken?(1) && board.taken?(7)
        #   "4"
        # elsif board.taken?(1) && board.taken?(3)
        #   "2"
        # elsif board.taken?(7) && board.taken?(9)
        #   "8"
        # elsif board.taken?(9) && board.taken?(3)
        #   "6"
        else
          (rand(9) + 1).to_s
        end
      elsif board.turn_count == 5
        if board.taken?(2) && board.taken?(1) && !board.taken?(3)
          "3"
        elsif board.taken?(4) && board.taken?(1) && !board.taken?(7)
          "7"
        elsif board.taken?(6) && board.taken?(9) && !board.taken?(3)
          "3"
        elsif board.taken?(8) && board.taken?(9) && !board.taken?(7)
          "7"
        # elsif board.taken?(2) && board.taken?(5)
        #   "8"
        # elsif board.taken?(8) && board.taken?(5)
        #   "2"
        # elsif board.taken?(4) && board.taken?(5)
        #   "6"
        # elsif board.taken?(6) && board.taken?(5)
        #   "4"
        else
          (rand(9) + 1).to_s
        end
      elsif board.turn_count == 6
        if board.taken?(3) && board.taken?(5) && !board.taken?(7)
          "7"
        elsif board.taken?(7) && board.taken?(5) && !board.taken?(3)
          "3"
        elsif board.taken?(6) && board.taken?(5) && !board.taken?(4)
          "4"
        elsif board.taken?(4) && board.taken?(5) && !board.taken?(6)
          "6"
        else
          (rand(9) + 1).to_s
        end
      elsif board.turn_count == 7
        if board.taken?(1) && board.taken?(7) && !board.taken?(4)
          "4"
        elsif board.taken?(1) && board.taken?(3) && !board.taken?(2)
          "2"
        elsif board.taken?(7) && board.taken?(9) && !board.taken?(8)
          "8"
        elsif board.taken?(9) && board.taken?(3) && !board.taken?(6)
          "6"
        else
          (rand(9) + 1).to_s
        end
      else
        (rand(9) + 1).to_s
      end
    end

    def corners(board)
      "1" unless board.taken?(1)
      "3" unless board.taken?(3)
      "7" unless board.taken?(7)
      "9" unless board.taken?(9)
    end


    def edges(board)
      "2" unless board.taken?(2)
      "4" unless board.taken?(4)
      "6" unless board.taken?(6)
      "8" unless board.taken?(8)
    end

  end
end
