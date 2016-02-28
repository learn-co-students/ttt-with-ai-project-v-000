class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    game = Game.new

    while !game.over?
      game.play
    end
  end
end