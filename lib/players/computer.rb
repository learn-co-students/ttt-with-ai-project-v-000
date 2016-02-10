#require pry

class Computer < Player

  def opp_token
    if self.token == "X"
      "O"
    elsif self.token == "O"
      "X"
    end
  end

  def corners
    corners = ["1", "3", "7", "9"]
  end

  def sides
    sides = ["2", "4", "6", "8"]
  end

  #board = ["X", "X", " ", "O", "X", " ", " ", " ", "O"]

  def move(board)
    if board.valid_move?("5")
      "5" 
    else
      input = self.winning_move(board) || input = self.blocking_move(board)
      if input == false
        input = self.corners.detect {|corner| board.valid_move?(corner)}
        if input == nil
          input = self.sides.detect {|side| board.valid_move?(side)}
        else
          input
        end
      else
        input    
      end
    end
  end


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def winning_move(board)
    entries = WIN_COMBINATIONS.collect {|combo| combo.collect {|i| board.cells[i]} }  
    target = entries.detect {|line| (line.count(self.token) == 2) && line.include?(" ")} 
    if target == nil
      false
    else
    winning_line = entries.index(target)
    input = (WIN_COMBINATIONS[winning_line][target.index(" ")] + 1).to_s 
    end 
  end 

  def blocking_move(board)
    entries = WIN_COMBINATIONS.collect {|combo| combo.collect {|i| board.cells[i]} }  
    target = entries.detect {|line| (line.count(self.opp_token) == 2) && line.include?(" ")}
    if target == nil
      false
    else
    winning_line = entries.index(target)
      input = (WIN_COMBINATIONS[winning_line][target.index(" ")] + 1).to_s 
    end 
  end

end




#computer = Computer.new("X")