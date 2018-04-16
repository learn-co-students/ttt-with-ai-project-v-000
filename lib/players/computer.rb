module Players

class Computer < Player

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def available_moves(cells)
    moves = []

    for i in 0...cells.length
      if cells[i] == " "
        moves << i
      end
    end

    moves
  end

  def full?(cells)
    cells.none? {|cell| cell == " "}
  end

  def won?(cells)
    WIN_COMBINATIONS.find do |combo|
      streak = cells[combo[0]] + cells[combo[1]] + cells[combo[2]]
      streak == "XXX" || streak == "OOO"
    end
  end

  def over?(cells)
    full?(cells) || won?(cells)
  end

  def winner(cells)
    win_combo = won?(cells)
    win_combo ? cells[win_combo[0]] : nil
  end

  def score(cells)
    if winner(cells) == @token
      10 - turn_count(cells)
    elsif winner(cells).nil?
      0
    else
      -10 + turn_count(cells)
    end
  end

  def turn_count(cells)
    cells.count {|cell| cell != " "}
  end

  def current_token(cells)
    turn_count(cells) % 2 == 0 ? "X" : "O"
  end

  def generate_state(move, cells)
    cells.map.with_index {|cell, i| i == move.to_i ? current_token(cells) : cell}
  end

  def minimax(cells)
    return score(cells) if over?(cells)

    scores = []
    moves = []

    available_moves(cells).each do |move|
      new_cells = generate_state(move, cells)
      scores << minimax(new_cells)
      moves << move
    end

    if current_token(cells) == @token
      max_score_index = scores.each.with_index.max[1]
      @input = moves[max_score_index]
      scores[max_score_index]
    else
      min_score_index = scores.each.with_index.min[1]
      @input = moves[min_score_index]
      scores[min_score_index]
    end
  end

  def move(board)
    if turn_count(board.cells) == 0
      @input = 4
    else
      minimax(board.cells)
    end

    puts "#{@token} has chosen: #{@input + 1}"
    board.cells[@input] = @token
    (@input + 1).to_s
  end

end

end
