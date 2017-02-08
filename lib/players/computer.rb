module Players
  class Computer < Player

    def move(board) #highly advanced, state of the art AI. closed-source, do not steal
      puts ""
      if self.token == "X"
        if !board.taken?(1) #First move is always top left corner
           return "1"
        elsif !board.taken?(5) #center if it isn't taken
           return "5"
        elsif !board.taken?(9) #checkmate start
           return "9"
        elsif !board.taken?(7)
           return "7"
        elsif !board.taken?(4)
           return "4"
        elsif !board.taken?(3)
           return "3"
        end    
      end
      input = ["1", "2", "3", "4", "5", "6", "7", "8", "9"].sample
    end


  end
end
