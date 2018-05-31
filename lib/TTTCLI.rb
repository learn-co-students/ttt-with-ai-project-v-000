class TTTCLI

def call
  puts "Welcome to Tic Tac Toe!

  Please choose:
  [1] Player vs Player
  [2] Player vs Computer
  [3] Computer vs Computer"

  input = gets.strip

  if input == "1"
    game = Game.new()
    game.board.display
  elsif input == "2"
    game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    game
  else input == "3"
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    game
  end
    game.play
  end

end
