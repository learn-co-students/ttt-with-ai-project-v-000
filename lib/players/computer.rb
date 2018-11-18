module Players
class Computer < Player

attr_reader :board 

  def move(board, game=Game.new)
    corners = ["1", "3", "7", "9"]

    if board.turn_count == 0
      return corners.sample

    if board.turn_count == 2 && board[5] == "O"
        if board[1] == "X"
          return 9
        elsif board[3] == "X"
          return 7
        elsif board[7] == "X"
          return 3
        elsif board[9] == "X"
           return 1
        end #ends boardifs
      end #ends board turn count 

      if board.turn_count == 2 && !board[5] == "O"
        return corners.sample 
      end #ends if board.turn_count 
      
    end 
    
    my_answer = ("1".."9").to_a.sample
      until board.valid_move?(my_answer)
        my_answer = ("1".."9").to_a.sample
    end
    my_answer
  end

  

end #ends class
end #ends module
