class Player::Human < Player

  def move(board)
    print "#{token}'s turn. Please select your move using 1-9 : "
    gets.strip
  end
end
