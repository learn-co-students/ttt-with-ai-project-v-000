class Player::Human < Player 
  def move(board)
    puts "Enter your move (1-9):"
    print ">"
    gets.strip
  end
end