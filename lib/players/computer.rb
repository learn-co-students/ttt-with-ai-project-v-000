require 'pry'

module Players
  class Computer < Player
    def move(board)
      if turn_count == 0
        move_first(board)
      elsif turn_count == 1 # After our opponent plays first, we want to play in the middle if possible, or else in a corner.
        go_for_the_middle(board)
      elsif turn_count >= 3 && turn_count <= 7
        win(board)
      else
        move_randomly(board)
      end
    end

    def go_for_the_middle(board)
      if board.cells[4] == " " # Array notation starts at 0
        5 # Matches colloquial interface for user, starting at 1
      else
        1
      end
    end

    def move_first(board)
      5
    end

    def win(board)
      move = nil
      Game.win_combinations.each do |wc|
        mine = 0 # Of the 3 spaces in the given win combination, we'll count up how many are already mine (hopefully 2), and how many are free (hopefully 1). A more efficient algo would break as soon as it found one of the opponent's tokens in the row.
        free = 0
        candidate = nil # i.e., the candidate for the winning move
        wc.each_with_index do |cell, index|
          if board.cells[cell] == self.token
            mine += 1
          elsif board.cells[cell] == " "
            free += 1
            candidate = wc[index] + 1
          end # finished checking the given cell
        end # finished counting up mine and free for the given win combination
        if mine == 2 && free == 1
          move = candidate
        end # finished altogether with the given win combination
        # binding.pry
      end # finished with all win combinations
      move = block(board) unless move != nil # If we can't win on this turn, we should try to block the other side from winning.
      move
    end

    def block(board) # Check if the opponent is about to win, and if so, block her.
      move = nil
      Game.win_combinations.each do |wc|
        hers = 0
        free = 0
        candidate = nil
        wc.each_with_index do |cell, index|
          if board.cells[cell] != self.token && board.cells[cell] != " "
            hers += 1
          elsif board.cells[cell] == " " # slightly redundant but written for parallelism with ftw(board)
            free += 1
            candidate = wc[index] + 1
          end
        end
        if hers == 2 && free == 1
          move = candidate
        end
      end
      move = find_two_winners(board) unless move
      move
    end

    def find_two_winners(board)
      n = 1
      valid_moves = []
      while n <= 9
        if board.valid_move?(n)
          valid_moves << n
        end
        n += 1
      end
      valid_moves.each do |m|
        pb = Board.new # For each projected board, we hope to find that it offers at least 2 ways to win on the next turn.
        pb.cells = board.cells # Unfortunately this seems to be passing by reference, not value (or reverse reference?), s.t. updating pb updates board, which is bad news.
        pb.cells[m - 1] = self.token
        binding.pry
        winners = []
        Game.win_combinations.each do |wc|
          mine = 0
          free = 0
          wc.each_with_index do |cell, index|
            candidate = nil
            if pb.cells[cell] == self.token
              mine += 1
            elsif pb.cells[cell] == " "
              free += 1
              candidate = wc[index] + 1 # A candidate is a possible move, 1 through 9.
            end
            if mine == 2 && free == 1
              winners << candidate
              # binding.pry
            end
          end # cell
        end # wc
        if winners.count(1) > 1 || winners.count(2) > 1 || winners.count(3) > 1 || winners.count(4) > 1 || winners.count(5) > 1 || winners.count(6) > 1 || winners.count(7) > 1 || winners.count(8) > 1 || winners.count(9) > 1
          # binding.pry
          return m
        end
      end # m
      move_randomly(board) # Move randomly if we didn't find two winners.
    end

    def move_randomly(board)
      n = 1
      computer_valid_moves = []
      while n <= 9
        if board.valid_move?(n)
          computer_valid_moves << n.to_s
        end
        n += 1
      end
      r = rand(computer_valid_moves.length)
      computer_valid_moves[r]
    end # #move_randomly

  end # Class Computer
end # Module Players
