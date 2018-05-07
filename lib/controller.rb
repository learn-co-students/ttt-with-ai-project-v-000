class GameController

  # how many players?
  # puts and gets?
  # game.new?

  def self.play
    puts "Welcome To Tic Tac Toe"
    puts "Enter number of human players:"
    int = gets.strip.to_i

    new_game = Game.new_by_player_count(int)

    new_game.play
  end

end
