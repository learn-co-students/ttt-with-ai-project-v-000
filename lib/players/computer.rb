module Players
  class Computer < Player

  def move(board)
    board.display
    if board.turn_count == 0 || board.turn_count.even?
        x =  "X"
      else
        x = "O"
    end
    puts "#{x}, select a square by entering 1-9 (1 for top left and 9 for bottom right):"
    input = ["1","2","3","4","5","6","7","8","9"].sample
 end
end
end
