class TicTacToeCLI

def initialize
    puts "Welcome to Tic Tac Toe."
    game = "yes"
    while game == "yes"
      start
      puts "Would you like to play again? (yes/no)"
      game = gets.strip.downcase
      puts ' '
    end
      puts "Thank you for playing. We hope you really enjoyed playing Tic Tac Toe"
      puts ' '
  end

  def start
    puts "What kind of game you would like to play? 0, 1 or 2 players?"
    puts "Write 0 for Computer v/s Computer game."
    puts "Write 1 for You v/s Computer game."
    puts "write 2 for You v/s You game."
    input = gets.strip
    if input == "0"
      new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      puts "Fight on!"
      new_game.board.display
      new_game.play
    elsif input == "1"
      puts "Player 1 is X."
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      puts "Fight on!"
      new_game.board.display
      new_game.play
    elsif input == "2"
      puts "Player 1 is X."
      new_game = Game.new
      puts "Fight On!"
      new_game.board.display
      new_game.play
    end
  end
end
