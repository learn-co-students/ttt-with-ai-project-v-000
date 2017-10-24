class TicTacToeCLI

  def call
    mode = ""
    puts "Welcome to tic tac toe!"
    until mode == "0" || mode == "1" || mode == "2"
      print "Double player(2), single player(1), or zero player(0): "
      mode = gets.strip
    end

    if mode == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    elsif mode == "1"
      game = Game.new(Players::Computer.new("X"))
    elsif mode == "2"
      game = Game.new
    end

    game.play
  end

end
