class Human < Player

  def move(position)
    puts "Where would you like to place your icon?"
    token_placement = gets.strip
  end

end