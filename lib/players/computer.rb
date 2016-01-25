require 'pry'

class Player::Computer < Player

  def other_token
    self.token == "X" ? "O" : "X"
  end

  def move(board)
    "1" if !board.taken?(1)
    strategies(board).to_s
  end

  def strategies(board)
    winning_move(board, token) || block_move(board, token) || random_move(board)
  end

  def winning_move(board, token) 
    winning_combo = Game::WIN_COMBINATIONS.detect do |win_combination|
      (board.cells[win_combination[0]] == token && board.cells[win_combination[1]] == token && 
        !board.taken?(win_combination[2] + 1)) ||
      (board.cells[win_combination[1]] == token && board.cells[win_combination[2]] == token && 
        !board.taken?(win_combination[0] + 1)) ||
      (board.cells[win_combination[0]] == token && board.cells[win_combination[2]] == token && 
        !board.taken?(win_combination[1] + 1))      
    end

   (winning_combo.detect{|index| !board.taken?(index+1)}+1).to_s if winning_combo
  end 

  def block_move(board, token) 
    block_combo = Game::WIN_COMBINATIONS.detect do |win_combination|
      (board.cells[win_combination[0]] == other_token && board.cells[win_combination[1]] == other_token && 
        !board.taken?(win_combination[2] + 1)) ||
      (board.cells[win_combination[1]] == other_token && board.cells[win_combination[2]] == other_token && 
        !board.taken?(win_combination[0] + 1)) ||
      (board.cells[win_combination[0]] == other_token && board.cells[win_combination[2]] == other_token && 
        !board.taken?(win_combination[1] + 1))      
    end
   (block_combo.detect{|index| !board.taken?(index+1)}+1).to_s if block_combo
  end 

  def random_move(board) 
    [1,2,3,4,5,6,7,8,9].shuffle.detect{|space| !board.taken?(space)}
  end

 end
