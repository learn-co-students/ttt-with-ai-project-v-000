module Players
  require 'pry'

  class Computer < Player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5,],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def move(board)
    if board.turn_count < 4
      first_move(board) || random(board)
    elsif 
      board.turn_count > 3
      block_or_win(board)
      random(board)   
    end
  end

  def first_move(board)
    input = "5" unless board.valid_move?("5") == false
  end

  def random(board)
    valid_moves =["1", "2", "3", "4", "5", "6", "?", "8", "9"]
    input = valid_moves.sample
    if board.valid_move?(input) == true
      return input
    else 
      random(board)
    end
  end

  def player_2
    if self.token == "X"
      return "O"
    else return "X"
    end
  end 

  def near_win_combo(board, token) 
    WIN_COMBINATIONS.detect do |index|
      ((board.cells[index[0]] == token && board.cells[index[1]] == token && board.cells[index[2]] == " ") ||
      (board.cells[index[0]] == token && board.cells[index[1]] == " " && board.cells[index[2]] == token) ||
      (board.cells[index[0]] == " " && board.cells[index[1]] == token && board.cells[index[2]] == token))
    end
  end

  def block_or_win(board)
    combo = near_win_combo(board, token)
    binding.pry
    if combo[0] == " " && combo[1] == self.token || player_2
      return combo[0] + 1 
    elsif combo[1] == " " && combo[2] == self.token || player_2
      return combo[1] + 1
    elsif combo[2] == " " && combo[1] == self.token || player_2
      return combo[2] + 1
      binding.pry
    end
  end

end
end

