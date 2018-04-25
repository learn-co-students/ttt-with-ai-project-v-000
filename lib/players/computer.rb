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
        #puts "Board spot: " + e.to_s

        tmp_board = []
        tmp_board.replace(board.cells)
        #tmp_board = board.cells
        tmp_board[e] = self.token if tmp_board[e].strip == ""
        w_w = win_weight(tmp_board)

        max_win = [e, w_w] if w_w > max_win[1]
      end

      return (max_win[1] + 1).to_s
    end

  private
      def win_weight(new_board)
        winners = self.win_combo
        puts "---"

        win_wei = 0
        winners.each do |e|
          e0 = position_value(new_board[e[0]])
          e1 = position_value(new_board[e[1]])
          e2 = position_value(new_board[e[2]])

          puts "#{e0} #{e1} #{e2}"

          val = e0 + e1 + e2

          win_wei += val**2
        end
        win_wei
      end

      def position_value(occupant)
        occ = occupant.strip
        return 0 if occ == ""
        return 1 if occ == self.token
        return -1 #otherwise
      end

  end
end
