class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe!"
    puts "How many players today? (0-2)"
    input = gets.chomp
    if input.to_i == 0
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    elsif input.to_i == 2
      Game.new.play
    else
      puts "Okay, are you playing X or O?"
      first_player = gets.chomp
      if first_player == "X" || first_player == "x"
        Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
      else
        Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
      end
    end
  end
end
