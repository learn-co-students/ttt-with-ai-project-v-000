module Players
  class Computer < Player


  def move(board)
    if !board.taken?(4)
      "5"
    elsif !board.taken?(0)
      "1"
    elsif !board.taken(6)
      "7"
    elsif !board.taken(8)
      "9"
    elsif !board.taken(2)
      "3"
    elsif !board.taken(1)
      "2"
    elsif !board.taken(5)
      "6"
    elsif !board.taken(7)
      "4"
    elsif !board.taken(3)
      "8"
    end
  end


  end
end
