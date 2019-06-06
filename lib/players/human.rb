module Players
  class Human < Player

  def move(board)
    board.display
    if board.turn_count == 0 || board.turn_count.even?
        x =  "X"
      else
        x = "O"
    end
    puts "#{x}, select a square by entering 1-9 (1 for top left and 9 for bottom right):"
    input = gets.strip
 end
end
end
