module Players
  class Computer < Player
    attr_reader :win_combo

    def initialize(token)
      super

      @win_combo = []
      @win_combo.replace(Game.new.win_combo)
    end

    def token
      super
    end

    def move(board)
      return "5" if board.turn_count == 0

      #find max win_weight
      max_win = [-1, -1]
      (0..8).each do |e|

        tmp_board = []
        tmp_board.replace(board.cells)
        #tmp_board = board.cells
        tmp_board[e] = self.token if tmp_board[e].strip == ""
        w_w = win_weight(tmp_board)

        max_win = [e, w_w] if w_w > max_win[1]
      end

      return (max_win[0] + 1).to_s
    end

  private
      def win_weight(new_board)
        winners = self.win_combo

        win_wei = 0
        winners.each do |e|
          e0 = position_value(new_board[e[0]])
          e1 = position_value(new_board[e[1]])
          e2 = position_value(new_board[e[2]])

          if (e0 == e1) && (e1 == e2) && (e0 != 0)
            win_wei = 32 #Winner
          elsif (e0 + e1 + e2 == 4) && (e0 != 0) && (e1 != 0) && (e2 != 0)
            win_wei = 16 #Need to block opponent
          elsif (e0 + e1 + e2 == 5) && (e0 != 0) && (e1 != 0) && (e2 != 0)
            win_wei = 0 #Blocked path
          elsif (e0 + e1 + e2 == 3) && (e0 != e1) && (e1 != e2) && (e2 != e0)
            win_wei = 4 #One and One - blocked opponent
          elsif (e0 + e1 + e2 == 4) && (e0 != 1) && (e1 != 1) && (e2 != 1)
            win_wei = 8 #Two of ours and an open space - has potential
          else
            win_wei = 0 #No value here.
          end
        win_wei
      end

      def position_value(occupant)
        occ = occupant.strip
        return 0 if occ == ""
        return 2 if occ == self.token
        return 1 #otherwise
      end

  end
end
