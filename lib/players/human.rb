class Human < Player

  attr_accessor :board

  def move(board)
    "Please enter position 1-9"
    input = gets.strip
  end

end
