class Player::Human < Player

  def move(cell)
    puts "Please enter a number between 1 and 9:"
    gets.strip
  end

end
