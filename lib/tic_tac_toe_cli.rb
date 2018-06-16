class TicTacToeCLI

  def self.call
    puts "welcome to tic tac toe!"
    player_one = PlayerMaker.get_player(1)
    player_two = PlayerMaker.get_player(2)
    game = Game.new(player_one, player_two)
    puts ""
    puts "good luck, have fun"
    puts "___________________"
    puts ""
    game.board.display
    puts "" #adds some readability
    game.play
  end
end
