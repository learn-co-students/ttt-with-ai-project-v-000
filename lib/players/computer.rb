module Players
  class Computer < Player

    def move(board)
      corners = [1,3,7,9]
      edges = [2,4,6,8]
      free = board.cells.each_with_index.select { |e, i| e == " " }.map { |pair| pair[1] }

      # 1. if you go first, go in a corner
      if board.turn_count == 0
        corners.sample.to_s

      # 2. if you go second, go in center
      elsif board.turn_count == 1
        if board.valid_move?("5")
          puts "I will go right in the middle"
          "5"
        # 3. unless player_1 went in center, then go in corner
        else
          puts "I'm going in the corner"
          corners.sample.to_s
        end

      # 4. check if you are about to win (2 in a row)
      elsif (board.game.win_combos.any? do |combo|
        a = []
        combo.any? do |e|
          a << board.cells[e]
          a.sort == ["#{self.token}", "#{self.token}", " "].sort
        end
      end)
        # 5. if yes, WIN!!!
        win_this = board.game.win_combos.detect do |combo|
          a = []
          combo.any? do |e|
            a << board.cells[e]
            a.sort == ["#{self.token}", "#{self.token}", " "].sort
          end
        end
        win_here = win_this.detect do |e|
          board.cells[e] == " "
        end
        puts "Victory shall be mine... at position #{win_here+1}!!"
        win_here+1

      # 6. if no, check if opponent is about to win (2 in a row)
      elsif (board.game.win_combos.any? do |combo|
        a = []
        combo.any? do |e|
          a << board.cells[e]
          a.sort == ["#{board.game.opponent.token}", "#{board.game.opponent.token}", " "].sort
        end
      end)
        # 7. if yes, block opponent
        block_this = board.game.win_combos.detect do |combo|
            a = []
            combo.any? do |e|
              a << board.cells[e]
              a.sort == ["#{board.game.opponent.token}", "#{board.game.opponent.token}", " "].sort
            end
          end
        block_here = block_this.detect do |e|
          board.cells[e] == " "
        end
        puts "I see what you're trying to do, #{board.game.opponent.token}. I choose position #{block_here+1}!"
        block_here+1

      # 8. Check if opponent has a potential double
      else
        # 8.a) Find all instances of ["X"," "," "] (opponent_lines)
        opponent_lines = board.game.win_combos.select do |combo| #=> return the combo where board.cells[combo] == x _ _
          a = []
          combo.each do |e|
            if e!=4
              a << board.cells[e]
            end
          end
          a.sort == [" ", " ", "#{board.game.opponent.token}"]
        end

        # 8.b) Check if there are multiple opponent_lines
        if opponent_lines.length > 1
          puts "You have a possible double in here: #{opponent_lines}"
          f = opponent_lines.flatten
          intersects = f.select { |e| f.count(e) > 1}.uniq

          #9. If opponent has potential double, block it!

          # 9.a) If a position in the "cross" is opponent-free, block the potential double there
          cross_combos = [[3,4,5],[1,4,7]]
          free_cross = cross_combos.detect do |combo|
            combo.none? { |e| board.cells[e] == board.game.opponent.token }
          end

          if free_cross
            block_edge = (f & free_cross)[0]
            puts "I have a free cross: #{free_cross}, so let's do position #{block_edge+1}"
            block_edge+1
          # 9.b) Otherwise block the potential double in an opponent-free diagonal
          else
            diagonals = [[0,4,8],[2,4,6]]
            free_diagonal = diagonals.detect do |combo|
              combo.none? { |e| board.cells[e] == board.game.opponent.token }
            end
            block_corner = (intersects & free_diagonal)[0]
            puts "No crosses free, but #{free_diagonal} is free. So block corner #{block_corner+1}"
            block_corner+1
          end

        # 10. If your opponent has no potential double, go anywhere
        else
          puts "I'm just going anywhere"
          free.sample.to_i+1
        end
      end # if
    end # move
  end # Computer
end # Players
