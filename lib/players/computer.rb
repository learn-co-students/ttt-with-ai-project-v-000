module Players

  class Computer < Player
    attr_accessor :choice
    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [2,4,6],
      [0,4,8]
    ]


    def move(board)
      minimax(board.cells, 0, self.token)
      "#{@choice + 1}"
    end

    def full?(board_state)
      board_state.each do |index|
        if index != "X" && index != "O"
          return false
        end
      end
      return true
    end

    def won?(board_state)
      WIN_COMBINATIONS.each do |comb|
        if board_state[comb[0]] == "X" && board_state[comb[1]] == "X" && board_state[comb[2]] == "X"
          return comb
        end
        if board_state[comb[0]] == "O" && board_state[comb[1]] == "O" && board_state[comb[2]] == "O"
          return comb
        end
      end
      return false
    end

    def turn_count(board_state)
      count = 0
      board_state.each do |i|
        if (i == "X" || i == "O")
          count += 1
        end
      end
      return count
    end

    def current_player(board_state)
      turn_count(board_state) % 2 == 0 ? "X" : "O"
    end

    def last_player(board_state)
      turn_count(board_state) % 2 == 1 ? "X" : "O"
    end

    def opponent(player)
      player ==  "X"? "O" : "X" 
    end

    def draw?(board_state)
      if !(won?(board_state)) && full?(board_state)
        return true
      else
        return false
      end
    end

    def over?(board_state)
      if won?(board_state) || draw?(board_state)
        return true
      else
        return false
      end
    end

    def winner(board_state)
      if won?(board_state)
        return board_state[won?(board_state)[0]]
      else
        return nil
      end
    end

    def update(board_state, move, char)
      arr = []
      board_state.each {|x| arr << x}
      arr[move] = char
      arr
    end

    def minimax(board_state, depth, player)
      return score(board_state, depth, player) if over?(board_state)
      depth += 1
      scores = [] 
      moves = []
      available(board_state).each do |move|
        new_board_state = update(board_state, move, current_player(board_state))
        scores.push minimax(new_board_state, depth, player) 
        moves.push move

      end
      if current_player(board_state) == player

        max_score_index = scores.each_with_index.max[1]
        @choice = moves[max_score_index]
        return scores[max_score_index]

      else
        min_score_index = scores.each_with_index.min[1]
        @choice = moves[min_score_index]
        return scores[min_score_index]
      end



    end


    def score(board_state, depth, player)
      if winner(board_state) == player
        return 10 - depth
      elsif winner(board_state) == opponent(player)
        return depth - 10
      else
        return 0
      end
    end

    def available(board_state)
      available_moves = []
      board_state.each_with_index do |space,index|
        available_moves << index if space == " "
      end
      available_moves
    end

  end

end