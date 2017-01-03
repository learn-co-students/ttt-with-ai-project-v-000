class CLI
  def initialize
  end
  def call
    puts "Let's play tictactoe!"
    puts "How many players? (0, 1, or 2)"
    number_of_players = gets.chomp.to_i
    if number_of_players == 0
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
      until game.won?
        game.play
      end
    elsif number_of_players == 1
      puts "Who should go first? Human or Computer?"
      first_player = gets.chomp
      if first_player == "Human"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        until game.won?
          game.play
        end
      elsif first_player == "Computer"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
        until game.won?
          game.play
        end
      end
    elsif number_of_players == 2
      puts "X goes first!"
      game = Game.new
      until game.won?
        game.play
      end
    end
  end
end
