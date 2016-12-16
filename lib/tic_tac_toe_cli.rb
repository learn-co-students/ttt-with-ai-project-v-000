class TicTacToeCLI

  def initialize
  end

  def call
    puts "Hello! Welcome to Tic Tac Toe!"
    puts "Would you like to play with 0, 1, or 2 players?"
    input = gets.strip

    case input
    when "0"
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
    when "1"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
    when "2"
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      game.play
    end
  end
end
