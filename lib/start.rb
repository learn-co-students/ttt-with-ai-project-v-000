class Start

  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "How many players?"

    input = gets.strip
      if input == "0"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
      elsif input == "1"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
      elsif input == "2"
        game = Game.new
        game.play
      end
  end
end
