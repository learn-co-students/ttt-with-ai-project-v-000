#Please ignore previous pull request. This is the code I was originally working with. 
#When I submitted, I took a look at the computer.rb solution. I copied two solutions 
#so that I could study them more, particularly a previous solution that seemed to go 
#along with what I had been reading about the minimax algorithim. I copied them over 
#just so I could look back at them and try to understand the logic. I came up with the 
#code here by writing out all possible move combinations I could think of, but when it 
#reaches a certain point I get a message saying that the stack is too deep. What can I do to make this work cleanly?

module Players
  class Computer < Player
    def move(board)
      move = nil

      if !board.taken?(5)
        move = "5"

      elsif !board.taken?(1)
        move = "1"

      elsif (board.position(1) == board.position(3) || board.position(5) == board.position(8))
        move = "2"

      elsif (board.position(1) == board.position(2) || board.position(5) == board.position(7) || board.position(6) == board.position(9))
        move = "3"

      elsif (board.position(1) == board.position(7) || board.position(5) == board.position(6))
        move = "4"

      elsif (board.position(3) == board.position(9) || board.position(4) == board.position(5))
        move = "6"

      elsif (board.position(1) == board.position(4) || board.position(3) == board.position(5) || board.position(8) == board.position(9))
        move = "7"

      elsif (board.position(2) == board.position(5) || board.position(7) == board.position(9))
        move = "8"

      elsif (board.position(1) == board.position(5) || board.position(3) == board.position(6) || board.position(7) == board.position(8))
        move = "9"
      end
    end
  end
end
