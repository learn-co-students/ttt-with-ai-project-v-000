module Players
  class Computer < Player
    attr_reader = :win_combo

    def initialize(token)
      super

      @win_combo = Game.new.WIN_COMBINATIONS
    end

    def token
      super
    end

    def move(board)
      return "4" if board.turn_count == 0

      t = self.token
      winners = self.win_combo
      df = {0 => 3, 1 => 2, 2 => 3, 3 => 2, 4 => 4, 5 => 2, 6 => 3, 7 => 2, 8 => 3}

      win_weight = []
      winners.each do |e|
        e0 = position_value(e[0])
        e1 = position_value(e[1])
        e2 = position_value(e[2])

        val = e0 + e1 + e2

        win_weight << val
      end


    end
  private
      def win_weight(new_board)
        
      end

      def position_value(occupant)
        occ = occupant.strip
        return 0 if occ == ""
        return 1 if occ == self.token
        return -1 #otherwise
      end

  end
end
