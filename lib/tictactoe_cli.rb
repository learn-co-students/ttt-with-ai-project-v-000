class TicTacToeCLI

  def start
    puts "Welcome to Tic Tac Toe! Choose a number below to get started: "
    puts "(1) Play against the computer"
    puts "(2) Play againt another human"
    puts "(3) Demo mode (the computer will play itself)"

    answer = gets.string.to_i

    case answer
    when 1
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    when 2
      game = Game.new
    when 3
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    end
    game.play
  end
end
