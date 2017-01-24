class Computer < Player
  include Concerns::Winable
  attr_reader :board

  INFINITY = 1.0/0.0

  # Return best move index + 1
  def move(board)
    puts "Com #{token} is thinking..."
    @board = board
    (min_max(4, token, -INFINITY, INFINITY)[1]+1).to_s
  end

  # Return array of possible moves
  # Return empty array if game is won
  def possible_moves
    return [] if won?
    (0..8).select {|i| board.cells[i] == " "}
  end

  # Return Opponent's token
  def rival_token
    token == "X" ? "O" : "X"
  end

  # Evaluate the board state and return a score
  # Add scores for each win_combo evaluation
  # Higher score means higer chance of wining
  def evaluate
    score = 0
    # Evaluate score for each wining combination
    score += evaluate_combo(WIN_COMBINATIONS[0])
    score += evaluate_combo(WIN_COMBINATIONS[1])
    score += evaluate_combo(WIN_COMBINATIONS[2])
    score += evaluate_combo(WIN_COMBINATIONS[3])
    score += evaluate_combo(WIN_COMBINATIONS[4])
    score += evaluate_combo(WIN_COMBINATIONS[5])
    score += evaluate_combo(WIN_COMBINATIONS[6])
    score += evaluate_combo(WIN_COMBINATIONS[7])
  end

  # Evaluate board with a wining combination
  # Return +100, +10, +1 for 3, 2, 1 in a row for self
  # Return -100, -10, -1 for 3, 2, 1 in a row for opponent
  # Return 0 for empty cell
  def evaluate_combo(combo)
    score = 0

    # Cell 1
    if board.cells[combo[0]] == token
      score = 1
     elsif board.cells[combo[0]] == rival_token
      score = -1
     end

    # Cell 2: two in a row
    if board.cells[combo[1]] == token
      if score == 1
        score = 10
      elsif score == -1
        return 0
      else
        score = 1
      end
    elsif board.cells[combo[1]] == rival_token
      if score == -1
        score = -10
      elsif score == 1
        return 0
      else
        score = -1
      end
    end

    # Cell 3: three in a row
    if board.cells[combo[2]] == token
      if score > 0
        score *= 10
      elsif score < 0
        return 0
      else
        score = 1
      end
    elsif board.cells[combo[2]] == rival_token
      if score < 0
        score *= 10
      elsif score > 1
        return 0
      else
        score = -1
      end
    end

    score
  end

  # Recurcive MinMax method with alpha-beta pruning
  # Return best move and score for each move
  def min_max(dept, player, alpha, beta)
    best_move = -1
    score = 0

    # Return best move when Game over or dept reached
    if possible_moves.size == 0 || dept == 0
      score = evaluate
      return [score, best_move]
    end

    # Try each possible move
    possible_moves.each do |move|
      board.cells[move] = player

      if token == player # Current move is for self
        score = min_max(dept-1, rival_token, alpha, beta)[0]
        if score > alpha
          alpha = score
          best_move = move
        end
      else # Current move is for opponent
        score = min_max(dept-1, token, alpha, beta)[0]
        if score < beta
          beta = score
          best_move = move
        end
      end

      # undo move
      board.cells[move] = " "

      #Prune: stop iteration when alpha >= beta
      break if alpha >= beta
    end
    score = player == token ? alpha : beta

    [score, best_move]
  end

end
