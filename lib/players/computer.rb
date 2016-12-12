
class Computer < Player

  def move(board)
    @valid_moves = board.cells.each_index.select { |index| board.cells[index] == " "}
    if @valid_moves.include?(4)
      "5"
    else 
     defend(board) || corners || random(board)
    end
  end


  def random(board)
    board.cells.each_index.select { |index| board.cells[index] == " "}.collect {|n| n + 1}.collect {|n| n.to_s}.sample
  end

  def corners
    if @valid_moves.include?(0)
     "1"
    elsif @valid_moves.include?(2)
     "3"
    elsif @valid_moves.include?(6)
    "7"
    elsif @valid_moves.include?(8)
    "9"
    end
  end

  def two_cells(board)
    Game::WIN_COMBINATIONS.find do |i|
      (board.cells[i[0]] == board.cells[i[1]] && !board.taken?(i[2]+1)) ||
      (board.cells[i[1]] == board.cells[i[2]] && !board.taken?(i[0]+1)) ||
      (board.cells[i[2]] == board.cells[i[0]] && !board.taken?(i[1]+1))
    end
  end

  def defend(board)
    if !two_cells(board).nil?
       two_cells(board).find { |index| board.cells[index] == " " }+ 1
    end
  end 


#my original logic was to iterate through the win combos, find the combo which in which two of the three index spaces were taken
#and return the index who's value wasn't equal to the other two (#gonna_win) but have not been able to make this work.
#I will return to this when I am more knowledgeable. For now I'm 
#going with the above two methods which splits the process into two: first iterate through the win combos to see if anywhere on the 
#board two of the three combo indexes taken (#two_cells) and if that returns true, find the empty cell of that combo
#and move there (#defend)

#def gonna_win(board)
  #Game::WIN_COMBINATIONS.each do |combo|
      #if (board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[0]] != " " && @valid_moves.include?(combo[2]))
        #return combo[2] + 1
        
      #elsif (board.cells[combo[1]] == board.cells[combo[2]] && board.cells[combo[1]] != " " && @valid_moves.include?(combo[0]))
        #return combo[0] + 1
        
      #elsif (board.cells[combo[0]] == board.cells[combo[2]] &&  board.cells[combo[0]] != " " && @valid_moves.include?(combo[1])) #=> should return [0,1,2]
         #return combo[1] + 1
  
      #else 
        #return board.cells.each_index.select { |index| board.cells[index] == " "}.collect {|n| n + 1}.collect {|n| n.to_s}.sample
      #end
    #end
#end

end
