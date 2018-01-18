module Players
  class Computer < Player

    def move(board)
      moves_left = []
      mine = []
      theirs = []

      board.cells.each_with_index do |cell, index|
        moves_left << index if cell == " "
      end

      board.cells.each_with_index do |cell, index|
        if cell == self.token
          mine << index
        elsif cell != self.token && cell != " "
          theirs << index
        end
      end

      def best_move(player)
        case player
        when player.include?(0) && player.include?(1) || player.include?(4) && player.include?(6) || player.include?(5) && player.include?(8)
          "3"
        when player.include?(1) && player.include?(2) || player.include?(4) && player.include?(8) || player.include?(3) && player.include?(6)
          "1"
        when player.include?(0) && player.include?(2) || player.include?(4) && player.include?(7)
          "2"
        when player.include?(3) && player.include?(4) || player.include?(2) && player.include?(8)
          "6"
        when player.include?(4) && player.include?(5) || player.include?(0) && player.include?(6)
          "4"
        when player.include?(3) && player.include?(5) || player.include?(0) && player.include?(8) || player.include?(2) && player.include?(6) || player.include?(1) && player.include?(7)
          "5"
        when player.include?(6) && player.include?(7) || player.include?(0) && player.include?(4) || player.include?(2) && player.include?(5)
          "9"
        when player.include?(7) && player.include?(8) || player.include?(2) && player.include?(4) || player.include?(0) && player.include?(3)
          "7"
        when player.include?(6) && player.include?(8) || player.include?(1) && player.include?(4)
          "8"
        end
      end

      if board.cells == Array.new(9, " ")
        "5"
      elsif best_move(mine)
        best_move(mine)
      elsif best_move(theirs)
        best_move(theirs)
      else
        (moves_left.sample + 1).to_s
      end
    end #move
  end
end
