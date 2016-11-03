require 'pry'

module Players
  class Computer < Player
    def move(board)
      if win(board, self) != nil # If you can win ...
        win(board, self) # ... do so.
      elsif win(board, opponent) != nil # Otherwise, if your opponent might win next turn ...
        win(board, opponent) # ... block him.
      elsif check_mate(board, self) != nil # Otherwise, if you can check-mate him ...
        check_mate(board, self) # ... do so.
      elsif check_mate(board, opponent) != nil # Otherwise, if your opponent might check-mate you next turn ...
        check_mate(board, opponent) # ... block his check-mate.
      elsif threaten(board, self) != nil # Otherwise, if you can get two in a row ...
        threaten(board, self) # ... do so.
      elsif move_strongly(board) != nil # Otherwise, if a generally strong position is available ...
        move_strongly(board) # ... take it.
      else # Otherwise ...
        move_randomly(board) # ... make any available move.
      end
    end

    def win(board, player)
      Game.win_combinations.each do |wc|
        already = 0
        free = 0
        candidate = nil
        wc.each_with_index do |cell, index|
          case board.cells[cell]
          when player.token
            already += 1
          when " "
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

    def check_mate(board, player)
      valid_moves(board).each do |m|
        pb = []
        board.cells.each{|e| pb.push(e)}
        pb[m.to_i - 1] = player.token
        winners = []
        Game.win_combinations.each do |wc|
          already = 0
          free = 0
          candidate = nil
          wc.each_with_index do |cell, index|
            case pb[cell]
            when player.token
              already += 1
            when " "
              free += 1
              candidate = wc[index] + 1 # A candidate is a possible winning move on the NEXT turn, 1 through 9, subject to playing m on THIS turn.
            end
          end # cell
          if already == 2 && free == 1
            winners << candidate
          end
        end # wc
        if winners.uniq.size > 1
          return m unless win(board, @opponent) != nil && win(board, @opponent) != m # i.e., if the other player can win on the next turn, and your would-be check-mate doesn't block him, then it's not a check-mate after all. While the flow of move(board) makes this check unnecessary when check_mate is invoked on self (since we've already confirmed the opponent can't win next turn), it is important when projecting the *opponent's* possible check-mate.
        end
      end
      nil
    end

    def threaten(board, player)
      threats = []
      Game.win_combinations.each do |wc|
        already = 0
        free = 0
        candidates = []
        wc.each_with_index do |cell, index|
          case board.cells[cell]
          when player.token
            already += 1
          when " "
            free += 1
            candidates << wc[index] + 1
          end
        end # cell
        if already == 1 && free == 2
          threats += candidates # i.e., if, for the given wc, the row has threat-potential, shovel each of its 2 open cells into the threats array. Later, we'll choose our favorite threat based on heuristics.
        end
      end # wc
      [5, 1, 3, 7, 9, 2, 4, 6, 8].each do |move| # Our moves in order of preference.
        if threats.include? move
          puts "I'm going to move to #{move} in order to threaten."
          return move
        end
      end
      nil
    end

    def move_strongly(board)
      valid_moves = valid_moves(board)
      if valid_moves.include? "5"
        return "5"
      else
        free_corners = ["1", "3", "7", "9"] & valid_moves
        free_corners[rand(free_corners.length)]
      end
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
