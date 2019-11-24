class TicTacToeCLI

  def initialize
  end

  def call
    puts "Welcome to Tic-Tac-Toe"
    players = -1
    while players < 0 || players > 2
      print "\nHow many players (0,1,2): "
      players = gets.chomp.to_i
    end

    case players
    when 0
      x = Players::Computer.new("X")
      o = Players::Computer.new("O")
      game = Game.new(x,o)
      game.play
    when 1
      selection = nil
      while selection != "X" && selection != "O"
        puts "Choose X or O"
        selection = gets.chomp
      end
      if selection == "X"
        x = Players::Human.new("X")
        o = Players::Computer.new("O")
      else
        o = Players::Human.new("O")
        x = Players::Computer.new("X")
      end
      game = Game.new(x,o)
      game.play
    when 2
      puts "Player X will go first followed by player O"
      x = Players::Human.new("X")
      o = Players::Human.new("O")
      game = Game.new(x,o)
      game.play
    end
  end

end
