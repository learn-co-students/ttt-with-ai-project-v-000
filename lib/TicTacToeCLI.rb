class TicTacToeCLI

def initialize
  puts "Welcome to TicTacToe"
end

def call
  puts "Hello Player"

  puts "1, 2, or 0 players?"
  response = gets.chomp

  puts "Ok." + response

  if response == '0'
    computerX = Players::Computer.new("X")
    computerY = Players::Computer.new("O")
    game0 = Game.new(computerX, computerY)
    puts "Who should go first and be player X?"
    puts "Player X choose a move (1-9)"
    game0.play

  elsif response == '1'
    computer = Players::Computer.new("O")
    game1 = Game.new(Players::Human.new("X"), computer)

    puts "Who should go first and be player X?"
    puts "Player X choose a move (1-9)"

    game1.play

  elsif response == '2'
    game2 = Game.new
    puts "Who should go first and be player X?"
    puts "Player X choose a move (1-9)"
      game2.play

  else
    puts "Option not available."
  end
 end

end
