require_relative '../player.rb'
require 'pry'

class Player::Computer < Player
  attr_accessor :scores

  def initialize(token)
    @token = token
    @scores = Array.new(9,0)
  end
  
  def valid_moves(board)
    moves = []
    for i in 1..9 do 
      if board.valid_move?(i.to_s)
        moves << i 
      else
        @scores[i-1] = nil
      end
    end
    moves
  end

  def score_options(board,current_token,initial_moves,depth=0)
    if board.full?
      return nil
    else
      initial_moves.each do |move|
        minmax(board,current_token,depth,move,initial_moves.dup)
      end
    end 
  end

  def move(board)
    @scores = Array.new(9,0)
    child_board = board.dup
    initial_moves = valid_moves(child_board)
    if initial_moves.include?(5)
      input = 5
    else
      score_options(child_board,@token,initial_moves)
      if @scores.compact.max > @scores.compact.min
        input = @scores.find_index{|element| element == @scores.compact.max} + 1
      else
        input = @scores.find_index{|element| element == @scores.compact.min} + 1
      end
    end
    input.to_s
  end

  def minmax(board,current_token,depth,move,available_moves)
    board.cells[move-1] = current_token
    options = Game::WIN_COMBINATIONS.find_all{|combo| combo.include?(move-1)}
    options.each do |element|
      if board.cells[element[0]] == board.cells[element[1]] && board.cells[element[0]] == board.cells[element[2]]
        board.cells[move-1] = " "
        if current_token == @token  
          @scores[move-1] = (10-depth) if (10-depth) > @scores[move-1] 
        else 
         @scores[move-1] = (depth-10) if (depth-10).abs > @scores[move-1].abs
        end
        return @scores[move-1]
      else
        current_token == @token ? current_token = "O" : current_token = "X"
        available_moves.delete(move)
        score_options(board,current_token,available_moves,depth+1)
        board.cells[move-1] = " "
      end
    end
  end
end