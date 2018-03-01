

module Players
  class Computer < Player
    
    WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [2, 5, 8], [1, 4, 7],
    [0, 4, 8], [2, 4, 6]
    ]
    
    def move(board)
      valid_moves = board.cells.each_index.select{|i| board.cells[i] == " "}
      valid_moves.map!{|m| (m+1).to_s}
      if valid_moves.include?("5")
        "5"
      elsif valid_moves.include?("1")
        "1"  
      elsif valid_moves.include?("3")
        "3"
      elsif valid_moves.include?("7")
        "7"
      elsif valid_moves.include?("2")
        "2"
      else 
        valid_moves.sample
      end
    end 
    
  # def intelligence(board)
     
   #  WIN_COMBINATIONS.any? do |combo|
   #    if !@valid_moves.include?(combo[0].to_i + 1) && board.cells[combo[0]] == board.cells[combo[1]] && @valid_moves.include?(board.cells[combo[2]] +1)
  #       board.cells[combo[2]] + 1
  #    elsif !@valid_moves.include?(combo[1]+1) && @board.cells[combo[1]] == @board.cells[combo[2]] && @valid_moves.include?(@board.cells[combo[0]] +1)
   #      @board.cells[combo[0]] + 1 
  #     elsif !@valid_moves.include?(combo[2]+1) && @boar#.cells[combo[2]] == @board.cells[combo[0]] && @valid_moves.include?(@board.cells[combo[1]] +1)
  #       @board.cells[combo[1]] + 1
  #     else
  #       @valid_moves.sample
  #     end
  #   end
  # end
    
  end
end
    