class Player::Human < Player
  def move(board)
    print "Please enter a number 1-9: "
    gets.strip
  end
end