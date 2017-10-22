def start
  puts "Welcome to TicTacToe!"
  input_string = ""
  puts "Please choose your game type."
  puts "1 for 1 player, 2 for 2 players, or 3 for I want to watch my computer play!:"

  input_string << input = gets.chomp.to_s

  puts "Who should go first?"
  puts "Type a for Player 1, b for Player 2, and c for Computer"

  input_string << value = gets.chomp.to_s

  case input_string
    when "1a"
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      new_game.play
    when "1b", "1c"
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      new_game.play
    when "3c", "3a", "3b"
      new_game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      new_game.play
    when "2a"
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      new_game.play
    when "2b", "2c"
      new_game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      new_game.play
  end #case

end #start
