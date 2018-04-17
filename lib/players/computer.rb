require "pry"
module Players
  class Computer < Player
    # Approach: because 3x3 tictactoe is such a small problem space and we already have
    # WIN_COMBINATIONS, the computer player just searches WIN_COMBINAIIONS to find the
    # best next move.
    def move (board)
      # get current winning combination options
      opponent = @token=="X" ? "O" : "X"
      my_winning_combinations = find_winning_combinations(board,@token, opponent)
      opponent_winning_combinations = find_winning_combinations(board, opponent, @token)
      # Can I win in one move? or can opponent?  If so, that is the move to make
      next_move = find_win(board,my_winning_combinations,token) || find_win(board,opponent_winning_combinations,opponent)
      # if no one can win right now, find best choice out of the winning combinations
      next_move = best_choice(board,my_winning_combinations) if !next_move
      # next_move is computed as board.cells index.  return the corresponding board position as string
      (next_move+1).to_s
    end

    private

    # return array of winning combinations for player
    def find_winning_combinations(board,player,opponent)
      Game::WIN_COMBINATIONS.reject do | combo |
        combo.count { | position | board.cells[position]==opponent } > 0
      end
    end

    # determine if there is a winning move for token in current board.
    # Returns board index of that move or nil
    def find_win (board, combinations, check_token)
      win_combo = combinations.find do | combo |
        combo.count {| position | board.cells[position] == check_token} ==2
      end
      return win_combo ?  win_combo.find { | position | !board.taken?(position+1) } : nil
    end

    # find the best choice.  Keeping it simple - best choice is just the position that
    # shows up the most in the current winning combinations
    def best_choice (board, combinations)
      # counts array will contain how many times each available cell index occurs
      # in the current winning combinations (if cell is taken, corresponding count is 0)
      # This approach results in a reasonable best choice almost all of the time.
      counts = [*0..8].map do |val|
        index_count = 0
        if !board.taken?(val+1)
          combinations.each { | combo| index_count += combo.count(val) }
        end
        index_count
      end
      # return the available index that shows up the most in the winning combinations (max).  In the
      # situation where there are no more winning combinations, just return first empty cell index
      if counts.max > 0
        choice = counts.index(counts.max)
      else
        choice = [*0..8].find_index { |cell_index| !board.taken?(cell_index+1)}
      end
      choice
    end
  end
end
