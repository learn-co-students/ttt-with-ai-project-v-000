require_relative '../player.rb'
require 'pry'

class Player::Computer < Player
  attr_accessor :optimal_move

  def initialize(token)
    @token = token
  end
  
  def valid_moves(board)
    moves = []
    
    for i in 1..9 do 
      moves << i if board.valid_move?(i.to_s)
    end
    moves
  end

  def move(board)
    return "5" if board.turn_count == 0
    child_board = board.dup
    minmax(@token,child_board) 
    @optimal_move.to_s
  end

  def score(board,depth)
    board.turn_count % 2 == 0 ? current_token = "O" : current_token = "X"
    if won?(board)
      if current_token == @token
        return 10 - depth 
      else
        return depth - 10
      end
    else
      return 0
    end
  end

  def minmax(current_token,board,depth = 0) 
    return score(board,depth) if won?(board) || draw?(board)
    scores = []
    moves = []
    depth += 1

    available_moves = valid_moves(board)
    
    available_moves.each do |current_move|
      board.cells[current_move-1] = current_token
      board.turn_count % 2 == 0 ? current_token = "O" : current_token = "X"
      scores << minmax(current_token,board,depth)
      moves << current_move
      board.undo(current_move)
    end
    current_token == @token ? index = scores.each_with_index.max[1] : index = scores.each_with_index.min[1]
    #scores.max.abs > scores.min.abs ? index = scores.each_with_index.max[1] : index = scores.each_with_index.min[1]
    @optimal_move = moves[index]
    binding.pry if depth == 1
    scores[index]
  end

  def won?(board)
    Game::WIN_COMBINATIONS.any? do |combo|
       board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] == board.cells[combo[2]] && board.cells[combo[0]] != " "
    end
  end

  def draw?(board)
    !won?(board) && board.full?
  end
end