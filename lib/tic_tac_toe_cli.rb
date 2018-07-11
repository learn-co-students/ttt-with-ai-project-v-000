class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    sleep(0.5)
    puts "How many players are there?"
    game = Game.new
    game.start
  end
end
