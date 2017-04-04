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
      puts "We hope you  enjoyed playing Tic Tac Toe. Adios Amigo!"
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
      puts "Carry on!"
      new_game.board.display
      new_game.play
    elsif input == "1"
      puts "You are player 1: 'X' and I will be player 2: 'O'."
      new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      puts "To Battle!"
      new_game.board.display
      new_game.play
    elsif input == "2"
      puts "Player 1: 'X' and player 2: 'O'."
      new_game = Game.new
      puts "Let's go!"
      new_game.board.display
      new_game.play
    end
  end
end
