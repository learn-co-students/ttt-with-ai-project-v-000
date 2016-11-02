require 'pry'

module Players
  class Computer < Player
    def move(board)
      if win(board, self) != nil # If you can win ...
        win(board, self) # win.
      elsif win(board, opponent) != nil # Otherwise, if your opponent might win next turn ...
        win(board, opponent) # ...block him.
      elsif check_mate(board) != nil # Otherwise, if you can check mate ...
        check_mate(board) # ... check mate.
      elsif turn_count == 1
        go_for_the_middle(board)
      elsif turn_count == 0
        move_first(board)
      else
        move_randomly(board)
      end
    end

    def go_for_the_middle(board)
      board.cells[4] == " " ? 5 : 1 # Play in the upper-left WLOG.
    end

    def move_first(board)
      "5" # This is a string to satisfy a test that is looking for a string. It's unclear why the test is looking for strings.
    end

    def win(board, player)
      Game.win_combinations.each do |wc|
        already = 0
        free = 0
        candidate = nil
        wc.each_with_index do |cell, index|
          if board.cells[cell] == player.token
            already += 1
          elsif board.cells[cell] == " "
            free += 1
            candidate = wc[index] + 1
          end
        end
        if already == 2 && free == 1
          return candidate
        end
      end
      nil
    end

    def check_mate(board)
      valid_moves(board).each do |m|
        pb = []
        board.cells.each{|e| pb.push(e)}
        pb[m.to_i - 1] = self.token
        winners = []
        Game.win_combinations.each do |wc|
          mine = 0
          free = 0
          candidate = nil
          wc.each_with_index do |cell, index|
            if pb[cell] == self.token
              mine += 1
            elsif pb[cell] == " "
              free += 1
              candidate = wc[index] + 1 # A candidate is a possible winning move on the NEXT turn, 1 through 9, subject to playing m on THIS turn.
            end
          end # cell
          if mine == 2 && free == 1
            winners << candidate
          end
        end # wc
        if winners.uniq.size > 1 # The key is that we have multiple winning moves NEXT turn, so that our opponent can only block one of them between now and then.
          return m
        end
      end
      nil
    end

    def move_randomly(board)
      valid_moves = valid_moves(board)
      valid_moves[rand(valid_moves.length)]
    end

    def valid_moves(board)
      n = 1
      valid_moves = []
      while n <= 9
        if board.valid_move?(n)
          valid_moves << n.to_s
        end
        n += 1
      end
      valid_moves
    end

  end # Class Computer
end # Module Players
