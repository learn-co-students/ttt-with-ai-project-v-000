require 'pry'
class Player::Computer_easy < Player
  
  attr_accessor :board

 WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def move(board)
    basic_move(board)
  end

 def basic_move(board)
   %w(1 2 3 4 5 6 7 8 9).shuffle.find { |i| !board.taken?(i)}
 end 
end
class Player::Computer_hard < Player
  
  attr_accessor :board
  
  def opponents_token
    self.token == "O" ? "X" : "O"    
  
  end 
  
  def make_winning_move(board)
    check_board(board, self.token)
  end
  
  def block_winning_move(board)
    check_board(board, opponents_token)
  end
  
  def check_board(board, current_token)
    one_move_away = Game::WIN_COMBINATIONS.find do |line|
      (board.cells[line[0]] == current_token && board.cells[line[1]] == current_token && !board.taken?(line[2]+1)) ||
      (board.cells[line[1]] == current_token && board.cells[line[2]] == current_token && !board.taken?(line[0]+1)) ||
      (board.cells[line[2]] == current_token && board.cells[line[0]] == current_token && !board.taken?(line[1]+1))
    end
    if one_move_away !=nil
      number =  one_move_away.detect {|index| board.cells[index] == " "}
      correct_placement = number.to_i + 1
      correct_placement.to_s
    end
  end
  
  def basic_move(board)
   %w(5 1 3 7 9 2 4 6 8).find { |i| !board.taken?(i)}
  end
  
  def move(board)
    make_winning_move(board) || block_winning_move(board) || basic_move(board)
  end
   
end