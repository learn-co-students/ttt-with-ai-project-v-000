class Computer < Player
  attr_reader :cells

  INFINITY = 1.0/0.0

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  # Return cell index + 1
  def move(board)
    puts "Com #{token} is thinking..."
    @cells = Array.new(board.cells)
    min_max(4, token, -INFINITY, INFINITY)[1]+1
  end

  def won?
    WIN_COMBINATIONS.find do |combo|
      combo.all? {|i| cells[i] == "X"} || combo.all? {|i| cells[i] == "O"}
    end
  end

  # Return array of possible moves
  def possible_moves
    return [] if won?
    (0..8).select {|i| cells[i] == " "}
  end

  # Return Opponent's token
  def rival_token
    token == "X" ? "O" : "X"
  end

  # Evaluate and score a move
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

  # Evaluate a wining combination
  def evaluate_combo(combo)
    score = 0

    # Cell 1
    if cells[combo[0]] == token
      score = 1
     elsif cells[combo[0]] == rival_token
      score = -1
     end

    # Cell 2
    if cells[combo[1]] == token
      if score == 1
        score = 10
      elsif score == -1
        return 0
      else
        score = 1
      end
    elsif cells[combo[1]] == rival_token
      if score == -1
        score = -10
      elsif score == 1
        return 0
      else
        score = -1
      end
    end

    # Cell 3
    if cells[combo[2]] == token
      if score > 0
        score *= 10
      elsif score < 0
        return 0
      else
        score = 1
      end
    elsif cells[combo[2]] == rival_token
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

  def min_max(dept, player, alpha, beta)
    best_move = -1
    score = 0

    if possible_moves.size == 0 || dept == 0
      score = evaluate
      return [score, best_move]
    end

    possible_moves.each do |move|
      # Try each move
      cells[move] = player
      if token == player
        score = min_max(dept-1, rival_token, alpha, beta)[0]
        if score > alpha
          alpha = score
          best_move = move
        end
      else
        score = min_max(dept-1, token, alpha, beta)[0]
        if score < beta
          beta = score
          best_move = move
        end
      end
      # undo move
      cells[move] = " "
      break if alpha >= beta
    end
    score = player == token ? alpha : beta
    [score, best_move]
  end

end
