class Human < Player

  def move(board)
    puts "Please enter a number 1 through 9."
    input = gets.chomp.to_i - 1
  end

end