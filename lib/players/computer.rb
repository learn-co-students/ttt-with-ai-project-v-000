module Players
  class Computer < Player

  def move(board)
    board.display
    array = board.cells
    indices = []
    if board.turn_count == 0 || board.turn_count.even?
        x =  "X"
      else
        x = "O"
    end
    puts "#{x}, select a square by entering 1-9 (1 for top left and 9 for bottom right):"
    
    array.each_with_index do |value, index|
      indices << index if value == " "
    end
    indices.map! {|index| (index + 1).to_s}
    input = indices.sample
  end
 end
end