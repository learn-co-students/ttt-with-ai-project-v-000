class Start

  def run
    puts "Welcome! How many players?"
    mode = gets.strip

    if mode == "0"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new).play
    elsif mode == "1"
      Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
    elsif mode == "2"
      Game.new(Player::Human.new("X"), Player::Human.new("O")).play
    end
    again
  end

  def again
    puts "Would you like to play again?"
    response = gets.strip.downcase

    if response == "yes"
      run
    elsif response == "no"
      puts "See you next time!"
      exit
    else
      puts "Please enter yes or no."
    end
  end



end # => end class