class TicTacToe


  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "Select Player Mode: 0 - 1 - 2"
  end

  def start
    input = gets.strip.to_i
    if input == 0
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      game.play
    elsif input == 1
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
      game.play
    elsif input == 2
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"))
      game.play
    end
  end

start
end
