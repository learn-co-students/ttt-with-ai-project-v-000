module Players
  class Computer < Player
    def move(board)
      puts "Please enter 1-9"
      STDIN.gets.strip
      if board.cells[0]==" "
        "5"
      elsif board.cells[1]==" "
        "3"
      elsif board.cells[2]==" "
        "4"
      elsif board.cells[3]==" "
        "4"
      elsif board.cells[5]==" "
        "7"
      elsif board.cells[6]==" "
        "7"
      elsif board.cells[7]==" "
        "2"
      elsif board.cells[7]==" "
        "4"
      elsif board.cells[8]==" "
        "5"
      end
    end
  end
end
