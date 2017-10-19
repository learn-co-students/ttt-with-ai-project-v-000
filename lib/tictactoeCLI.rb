class TicTacToeCLI
  def initialize
      puts "Welcome to Tic Tac Toe!"
      puts "To begin, would you like to play with 0, 1, or 2 players?"
      input = gets.chomp.to_i
      case input
      when 0
        Game.new(Players::Computer("X"), Players::Computer("O"), Board.new).play
      when 1
        puts "You are player X. You go first."
        Game.new(Players::Human("X"), Players::Computer("O"), Board.new).play
      when 2

  end
end
