class TicTacToeCLI

  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe."
    puts "How many players?"
    puts "Enter: 0, 1, or 2"
    game_type = gets.chomp

    if game_type == "0"
        Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    elsif game_type == "1"
        Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    elsif game_type == "2"
        Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    else
      puts "Invalid selection"
    end
    play_again?
  end

  def play_again?
    puts "Do you want to play again? y/n"
    play_again = gets.chomp
    if play_again == "y"
      call
    elsif play_again == "n"
      puts "Good bye!"
      return
    else
      self.play_again?
    end
  end

end #class
