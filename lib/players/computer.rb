module Players
  require 'pry'

  class Computer < Player

  WIN_COMBINATIONS = [[0,1,2],[3,4,5,],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def move(board)
      first_move(board) || near_win_combo(board) || random(board)
  end

  def first_move(board)
    input = "5" unless board.valid_move?("5") == false
  end

  def random(board)
    valid_moves =["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    input = valid_moves.sample
    if board.valid_move?(input) == true
      return input
    else 
      random(board)
    end
  end
  
  def player_2
    self.token == "X" ? "O" : "X"
  end 

  def near_win_combo(board) 
    WIN_COMBINATIONS.each do |index|
      if board.cells[index[0]] == self.token && board.cells[index[1]] == self.token && board.cells[index[2]] == " "
        return "#{index[2]+1}"
      elsif board.cells[index[1]] == self.token && board.cells[index[2]] == self.token && board.cells[index[0]] == " "
        return "#{index[0]+1}"
      elsif board.cells[index[2]] == self.token && board.cells[index[0]] == self.token && board.cells[index[1]] == " "
        return "#{index[1]+1}"
      elsif board.cells[index[0]] == player_2 && board.cells[index[1]] == player_2 && board.cells[index[2]] == " "
        return "#{index[2]+1}"
      elsif board.cells[index[1]] == player_2 && board.cells[index[2]] == player_2 && board.cells[index[0]] == " "
        return "#{index[0]+1}"
      elsif board.cells[index[2]] == player_2 && board.cells[index[0]] == player_2 && board.cells[index[1]] == " "
      return "#{index[1]+1}" 
      end
    end
    return nil
  end
end
end

