require_relative '../../config/environment.rb'

class AI_Logic < Player

  attr_reader :best_choice

  def initialize(token)
    @opponent = switch(token)
    @token = token
  end

  def move(board)
    binding.pry
    potential_board = board.dup
    minmax(potential_board, token)
    # binding.pry
    (best_choice + 1).to_s
  end

  def minmax(board, current_token)
    return score(board) if game_over?(board)

    scores = {}
    binding.pry
    board.available_spaces.each do |space|
      temp_game = board.dup
      # binding.pry
      temp_game.place_token(space, current_token)

      scores[space] = minmax(temp_game, switch(current_token))
    end
    
    @best_choice, best_score = best_move(current_token, scores)
    best_score
  end

  def game_over?(board)
    board.has_combo || board.full?
  end

  def best_move(token, scores)
    min, max = scores.minmax_by { |space, score| score }
    token == @token ? max : min
  end

  def score(board)
    if board.winner == token
      return 10
    elsif board.winner == @opponent
      return -10
    end
    0
  end
  
  def switch(token)
    token == "X" ? "O" : "X"
  end
  
end

# computer = Player::Computer.new("X")
# board = Board.new
# binding.pry
# computer.move(board)