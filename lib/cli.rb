class TicTacToeCLI

  def call
    puts "Hello, how are you today?"
    sleep 1
    puts "How many players 1, 2, or do you want to watch computer player against computer player(select 0)?"
    input = gets.strip
    if input.to_i == 0

      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O")).play
    elsif input.to_i == 2
      puts "Please pick a number between 1-9, X will go first!"
      Game.new.play

    elsif input.to_i == 1
      puts "Computer is X and will go first!"
      sleep 1
      puts "Please press 1 and enter to start!"
      input = gets.strip
      if input == "X"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O")).play
    else
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O")).play
      end
    end
  end

end
