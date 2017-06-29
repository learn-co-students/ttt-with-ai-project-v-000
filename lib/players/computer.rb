module Players
  class Computer < Player

    def move(board)
        move = nil
        msg = "Computer moves to "
        if !board.taken?(5)
             move = "5"
             puts "Computer moves to #{move}."
             move
        elsif !board.taken?(3)
            move = "3"
            puts msg + "#{move}."
            move
        elsif !board.taken?(1)
            move = "1"
            puts msg + "#{move}."
            move
        elsif !board.taken?(9) 
            move = "9"
            puts msg + "#{move}."
            move
         elsif !board.taken?(7) 
            move = "7"
            puts msg + "#{move}."
            move
         elsif !board.taken?(6)
            move = "6"
            puts msg + "#{move}."
            move
        elsif !board.taken?(4)
            move = "4"
            puts msg + "#{move}."
            move
        elsif !board.taken?(2)
            move = "2"
            puts msg + "#{move}."
            move
        end
    end

  end
end
