module Players
  class Computer < Player
    def move(board)
      if start(board)
        start(board)
      elsif block_or_win(board)
        block_or_win(board)
      else
        corners_and_sides(board)
      end
    end

    def start(board)
      board.taken?(5) ? false : "5"
    end

    def block_or_win(board)
      cpu = self.token
      opp = ""
      cpu == "X" ? opp = "O" : opp = "X"
      Game::WIN_COMBINATIONS.each do |combo|
        a = combo.select{|x| board.cells[x] == cpu}
        b = combo.select{|x| board.cells[x] == opp}
        if a.count == 0 && b.count == 2
          block = combo.detect{|x| board.cells[x] == " "}
          return block + 1
        elsif a.count == 2 && b.count == 0
          win = combo.detect{|x| board.cells[x] == " "}
          return win + 1
        end
      end
      false
    end

    def corners_and_sides(board)
      cpu = self.token
      opp = ""
      cpu == "X" ? opp = "O" : opp = "X"
      sides = [1,3,5,7]
      corners = [0,2,6,8]
      if board.cells[0] == opp && board.cells[8] == opp
        a = sides.detect{|s| board.cells[s] == " "}
        return a + 1
      elsif board.cells[2] == opp && board.cells[6] == opp
        b = sides.detect{|s| board.cells[s] == " "}
        return b + 1
      else
        c = corners.detect{|c| board.cells[c] == " "}
        s = sides.detect{|s| board.cells[s] == " "}
        return c + 1 if c != nil
        return s + 1 if s != nil
      end
    end

  end



end
