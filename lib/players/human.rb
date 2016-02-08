class Player::Human < Player
  def move(board)
    # takes in a board argument and allows a human player to enter a move via the CLI 
    puts "What's your move player #{token}?"
    input = gets.strip
     # return the value the user enters
    if input == "quit" || input == "q" || input == "Quit" || input == "Exit" || input == "exit"
      puts "Ending game.\n
     _.-._
    | | | |_
    | | | | |
    | | | | |
  _ |  '-._ |
  \\`\\`-.'-._;
   \\    '   |
    \\  .`  /
     |    |\n
      BYE!\n\n\n"
      exit
    else
      puts "Human player #{token} moved"
      input
    end

  end

end