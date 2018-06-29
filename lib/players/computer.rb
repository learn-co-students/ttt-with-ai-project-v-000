module Players
  class Computer < Player

  def move(board)
    #binding.pry
    m = nil
    if !board.taken?(6)
      m = "6"
      elsif board.cells[1] == " "
      m = "2"
      elsif board.cells[3] == " "
      m = "4"
      elsif board.cells[7] == " "
      m = "8"
      elsif board.cells[0] == " "
      m = "1"
      elsif board.cells[2] == " "
      m = "3"
      elsif board.cells[4] == " "
      m = "5"
      elsif board.cells[6] == " "
      m = "7"
      elsif board.cells[8] == " "
      m = "9"
    end
    puts "Computer is thinking..."
    puts m
    m
  end
end
end
