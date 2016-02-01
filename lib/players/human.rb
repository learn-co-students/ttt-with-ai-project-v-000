class Human < Player
  def move(board)
    board.display
    puts "What's your move?"
    input = gets.chomp
    input
  end
end
