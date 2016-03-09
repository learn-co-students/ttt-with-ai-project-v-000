class TicTacToe_CLI
  def start
    puts "Welcome to Tic Tac Toe!"
    puts "Please select a player option:"
    puts "Type '0' for Computer vs. Computer"
    puts "Type '1' for Human vs. Computer"
    puts "Type '2' for Human vs. Human"
    puts "Type 'exit' to quit the game."

    input = gets.chomp
    case input
    when '0'
      game = Game.new(Player::Computer.new('X'), Player::Computer.new('O'))
      puts "Player 1 is 'X'. Player 2 is 'O'."
      game.play
    when '1'
      token_input = nil
      puts "Please type 'X' if you would like to go first. Otherwise, type 'O'."
      token_input = gets.chomp.upcase
      game = Game.new(Player::Human.new('X'), Player::Computer.new('O')) if token_input == 'X'
      game = Game.new(Player::Computer.new('X'), Player::Human.new('O')) if token_input == 'O'
      game.play
    when '2'
      game = Game.new
      puts "Player 1 is 'X'. Player 2 is 'O'."
      game.play
    when 'exit'
      puts "Thank you for playing. Goodbye."
    else
      puts "Invalid command. Please try again.\n\n"
      start # Calls the #start method again
    end
    play_again_msg unless input == 'exit'
  end

  def play_again_msg
    puts "One more round? (y/n)"
    play_again = gets.chomp.downcase
    if play_again == 'y'
      start # Calls the #start method again
    elsif play_again == 'n'
      puts "Thank you for playing. Goodbye."
    else
      puts "Invalid command. Please try again."
      play_again_msg
    end
  end
end