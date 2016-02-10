#require pry

class Computer < Player

  attr_accessor :board


  def opp_token
    if self.token == "X"
      "O"
    elsif self.token == "O"
      "X"
    end
  end

board = ["X", "X", " ", "O", "X", " ", " ", " ", "O"]

  def move(board)
     input = (self.winning_move(board) || self.blocking_move(board) || "5" || "1"  )
    if board.valid_move?(input)
      input     
    else
      input = "2" 
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
    entries = WIN_COMBINATIONS.collect {|combo| combo.collect {|i| board[i]} }  
    target = entries.detect {|line| (line.count(self.token) == 2) && line.include?(" ")} 
      if target != nil
        input = (target.index(" ") + 1).to_s
      else
        false  
      end  
  end

  def blocking_move(board)
    entries = WIN_COMBINATIONS.collect {|combo| combo.collect {|i| board[i]} }  
    target = entries.detect {|line| (line.count(self.opp_token) == 2) && line.include?(" ")}
      if target != nil
        input = (target.index(" ") + 1).to_s
      else
        false  
      end  
  end

end




#computer = Computer.new("X")

#computer.win_or_block(board)
