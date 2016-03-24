def greeting
  puts "\r\n"
  puts "Welcome to Tic-Tac-Toe!"
  puts "\r\n"
  puts "What type of game would you like to play?"
  puts "\r\n"
  puts "Enter 1 for a 1-Player game vs. the computer."
  puts "Enter 2 for a 2-Player game with alternating turns."
  puts "Enter 0 for a game played between 2 computer players."
  puts "\r\n"
end

def start
  prompt = ">"
  greeting
  print prompt
  game_type = gets.strip.to_i
  while game_type < 0 || game_type > 2
    puts "Invalid input. Please re-enter a choice from above."
    print prompt
    game_type = gets.strip.to_i
  end
  player_1_token = "Unset"
  player_2_token = "Unset"
  if game_type == 1
    puts "Game type has been set as 1-Player."
    puts "Player 1: What token do you wish to use? (Enter X or O)"
    print prompt
    player_1_token = gets.strip
    unless player_1_token == "X" || player_1_token == "O"
      puts "Invalid input. Please re-enter a choice from above."
      print prompt
      player_1_token = gets.strip
    end
    if player_1_token == "X"
      player_2_token = "O"
    elsif player_1_token == "O"
      player_2_token = "X"
    end
    puts "Player 1 token has been set as #{player_1_token}."
    puts "\r\n"
    puts "Player 2 (Computer) token has been set as #{player_2_token}."
    game = Game.new(player1 = Player::Human.new(player_1_token), player2 = Player::Computer.new(player_2_token), board = Board.new)
  elsif game_type == 2
    puts "Game type has been set as 2-Player."
    puts "Player 1: What token do you wish to use? (Enter X or O)"
    print prompt
    player_1_token = gets.strip
    unless player_1_token == "X" || player_1_token == "O"
      puts "Invalid input. Please re-enter a choice from above."
      print prompt
      player_1_token = gets.strip
    end
    if player_1_token == "X"
      player_2_token = "O"
    elsif player_1_token == "O"
      player_2_token = "X"
    end
    puts "Player 1 token has been set as #{player_1_token}."
    puts "\r\n"
    puts "Player 2 token has been set as #{player_2_token}."
    game = Game.new(player1 = Player::Human.new(player_1_token), player2 = Player::Human.new(player_2_token), board = Board.new)  
  elsif game_type == 0
    player_1_token = "X"
    player_2_token = "O"
    puts "Game type has been set as 0 (Two computer players)."
    game = Game.new(player1 = Player::Computer.new(player_1_token), player2 = Player::Computer.new(player_2_token), board = Board.new) 
  end
  game.play
  puts "Play Again? (Y/N)"
  print prompt
  next_round = gets.strip
  unless next_round == "Y" || next_round == "N"
    puts "Invalid input. Please enter a choice from above."
    print prompt
    next_round = gets.strip
  end
  if next_round == "Y"
    start
  elsif next_round == "N"
    puts "Exiting - Have a great day!"
  end

end






