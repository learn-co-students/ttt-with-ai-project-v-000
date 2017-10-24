class TicTacToeCLI
  def initialize
  end

  def call
    puts "Hi there, welcome to TicTacToe"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "
    puts "-----------"
    puts "   |   |   "

    game = Game.new
    puts "What kind of game would you like to play?"
    game.start
    game.end
  end
end
