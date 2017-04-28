class TicTacToeCLI

  def start

    puts "Welcome to Tic Tac Toe! Select one of the following options:"
    puts "Option 1 = Computer will play against itself."
    puts "Option 2 = Play against the computer."
    puts "Option 3 = Play against a friend."

    option_num = gets.strip.to_i

    case option_num

    when 1
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    when 2
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
    when 3
      game = Game.new
    end

    game.play
  end

end
