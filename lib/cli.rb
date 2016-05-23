class CLI
  attr_accessor :game

  def call
    setup_game
    game.play
  end

  def setup_game
    puts "Would you like to play a game of Tic Tac Toe? (y/n)"
    input = gets.strip
    if input == "y"
      puts "How many players? (0, 1, 2)"
        input = gets.strip
        if input == "0"
          self.game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
        elsif input == "1"
          self.game = Game.new(Player::Human.new("X"), Player::Computer.new("O"))
        elsif input == "2"
          self.game = Game.new(Player::Human.new("X"), Player::Human.new("O"))
        else
          puts "Sorry, invalid input."
        end
    elsif input == "n"
      puts "Thank you and have a nice day!"
    else
      puts "Invalid input. Please re-enter."
      new_game
    end
  end
end