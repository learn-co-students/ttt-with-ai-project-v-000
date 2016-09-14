class Human < Player
  def move(board)
    puts "Where would you like to place your token? (1-9)"
    input = gets.strip
  end
end
