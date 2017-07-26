module Players
  class Computer < Player

    def move(board)
      if  board.cells[4] == " "
        "5"
      elsif [1,3,7,9].any? {|i| !board.taken?(i)}
        move = [1,3,7,9].detect{|i| !board.taken?(i)}.to_s
      else [2,4,6,8].any? {|i| !board.taken?(i)}
        move = [2,4,6,8].detect{|i| !board.taken?(i)}.to_s
      end
    end

  end
end
