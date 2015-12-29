require 'pry'

class Player::Computer < Player
  
  def other_token
    self.token == "X" ? "O" : "X"
  end

  def move(board_inst)
    best_option(board_inst).to_s
  end

  def best_option(board)
    one_move_win(board) || block_move(board) || strategic_move(board)
  end


  def one_away(board, token)
    Game::WIN_COMBINATIONS.detect do |combo|
############ Try to insert PROC?? ###########
      (board.cells[combo[0]] == token && board.cells[combo[1]] == token && !board.taken?(combo[2] + 1)) ||
      (board.cells[combo[0]] == token && board.cells[combo[2]] == token && !board.taken?(combo[1] + 1)) ||
      (board.cells[combo[1]] == token && board.cells[combo[2]] == token) && !board.taken?(combo[0] + 1)
    end
  end

  def strategic_move(board)
    [5,1,3,7,9,2,4,6,8].detect{|p| board.valid_move?(p)}  # Add back into array ->  
  end

  def one_move_win(board)
    if one_away(board, self.token).class == Array
      one_away(board, self.token).select{|pos| board.cells[pos] == " "}.join("").to_i + 1
    end
  end

  def block_move(board)
    if one_away(board, other_token).class == Array
      one_away(board, other_token).select{|pos| board.cells[pos] == " "}.join("").to_i + 1
    end
  end
end