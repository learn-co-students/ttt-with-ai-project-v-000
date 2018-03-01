class Human < Player
  def move(board)
    puts "Please enter 1-9:"
    input = gets.chomp
    input
  end
end