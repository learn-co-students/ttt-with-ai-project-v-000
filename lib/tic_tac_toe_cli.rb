class TicTacToeCLI

  def initialize
  end

  def call
    puts "Tic-Tac-Toe: THE GAME"
    loop do
      puts "Wanna play? 0 for Computer vs. Computer, 1 for You vs. Computer, 2 for You vs. a Human."
      puts "Type exit to end the game."
      input = gets.strip

      if input == "0"
        game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
        game.play
      elsif input == "1"
        game = Game.new(Player::Human.new("X"), Player::Computer.new("O"))
        game.play
      elsif input == "2"
        game = Game.new(Player::Human.new("X"), Player::Human.new("O"))
        game.play
      elsif input.downcase != "exit"
        puts "Invalid input. Try again."
        game_loop
      else
        puts "Goodbye."
        break
      end
    end

  end

end
