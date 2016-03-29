def welcome
  puts "\r\n"
  puts "Welcome to Tic-Tac-Toe!"
  puts "\r\n"
  print "How many players would like to play
        Press 0: Computer vs Computer
        Press 1: 1-Player vs Computer
        Press 2: Player vs Player
        > "
end

def start_game
  welcome
  players = gets.strip
  num = players.to_i

  case num
    when 0
      com_vs_com
    when 1
      hum_vs_com
    when 2
      hum_vs_hum
  end
end

def com_vs_com
  player_1_token = "X"
  player_2_token = "O"
  game = Game.new(Player::Computer.new(player_1_token), Player::Computer.new(player_2_token), board = Board.new)
  game.board.display
  game.play
  play_again?
end

def hum_vs_com
  puts "Player, please enter if you would like to be X or O:"
  human_token = gets.strip
  if human_token == "X"
    computer_token = "O"
  else
    computer_token = "X"
  end
  game = Game.new(Player::Human.new(human_token), Player::Computer.new(computer_token), board = Board.new)
  game.board.display
  game.play
  play_again?
end

def hum_vs_hum
  puts "Player 1, please enter if you would like to be X or O:"
  player_1_token = gets.strip
  if player_1_token == "X"
    player_2_token = "O"
  else
    player_2_token = "X"
  end
  game = Game.new(Player::Human.new(player_1_token), Player::Human.new(player_2_token), board = Board.new)
  game.board.display
  game.play
  play_again?
end

def play_again?
  puts "Would you like to play again?(Y/N)"
  choice = gets.strip
  if choice == "Y" || choice == "y" || choice == "Yes" || choice == "yes"
    start_game
  else
    exit
  end
end
