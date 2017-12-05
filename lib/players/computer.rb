module Players
  class Computer < Player

    def move(board)
      move = nil
      corner = [1, 3, 7, 9]

      if board.valid_move?(5)
        move = "5"
      elsif board.valid_move?(1) || board.valid_move?(3) || board.valid_move?(7) || board.valid_move?(9)
        move = corner.detect{|i| board.valid_move?(i)}
      else
        move = rand(1..9).to_s
      end
    end
  end
end


# def move(board)
#   rand(1..9).to_s
#   # computer plays - but as it's not given any logic - it's total crap.
# end

# do not understand what's going on in examples of logic -- wait until lab walkthrough part 2 to get better idea.
# game plays - but logic is faulty - goes for corners first then crap's out.  
