require_relative '../player.rb'

class Player::Computer < Player
  attr_accessor :scores, :moves

  def initialize(token)
    @token = token
    @scores = [0,0,0,0,0,0,0,0,0]
    @moves = []
  end
  
  def valid_moves(board)
    @moves.clear
    for i in 1..9 do 
      @moves << i if board.valid_move?(i.to_s)
    end
  end

  def score_options(board)
    char = ["X","O"]
    char.delete(@token)
    child_board = board.cells.dup
    @moves.each do |move|
      options = Game::WIN_COMBINATIONS.find_all{|combo| combo.include?(move-1)}
      options.each do |element|
        child_board[move-1] = @token
        @scores[move-1] = 10 if options[0] == options[1] && options[0] == options[2]
        child_board.delete_at(move-1)
        child_board[move-1] = char[0]
        @scores[move-1] = -10 if options[0] == options[1] && options[0] == options[2]
        child_board.delete_at(move-1)
      end
    end
  end

  def move(board)
    valid_moves(board)
    score_options(board)
    input = @moves[0]
    input = @scores.find_index(10)-1 if @scores.find_index(10) != nil
    input = @scores.find_index(-10)-1 if @scores.find_index(-10) != nil
    input.to_s
  end
end