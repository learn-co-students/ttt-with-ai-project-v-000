class CLI

  def game_choice
      puts "What kind of game would you like to play?"
      puts "Enter 0 for Computer vs Computer"
      puts "Enter 1 for Computer vs Human"
      puts "Enter 2 for Human vs Human"
      puts "To quit, type 'exit'."
      puts "Have fun!"
      input = gets.strip
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    game_choice
  end

  case input
  when "0"
    puts "Computer vs Computer!"
    @game = Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
    replay?
  when "1"
    one_player
    replay?
  when "2"
    two_player
    replay?
  when "exit"
    puts 'Goodbye! Come Again!'
  else
    puts 'Invalid input'
    game_choice
  end

end

  def one_player
    puts "Would you like to go first? (y/n)"
    input = gets.strip
    if input == "y"
      Game.new(Players::Human.new('X'), Players::Computer.new('O')).play
    elsif input == 'n'
      Game.new(Players::Computer.new('X'), Players::Human.new('O')).play
    else
      game_choice
    end
  end

  def two_player
    @game = Game.new(Players::Human.new('X'), Players::Human.new('O')).play
  end

  def replay?
    puts "Would you like to play again? (y/n)"
    input = gets.strip
    if input == 'y'
      game_choice
    end
    puts "Goodbye!"
  end
end
