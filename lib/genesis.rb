def main_start
  input = nil
  puts "Welcome to TicTacToe."
  puts "Please Choose a game mode:"
  puts "(1). Human vs. Human"
  puts "(2). Human vs. Computer"
  puts "(3). Computer vs. Computer"
  until input.to_i.between?(1,3)
    input = gets.chomp
  end
  case input
  when "1"
    human_vs_human
  when "2"
    human_vs_ai
  when "3"
    ai_vs_ai
  end
end

def create_ai(token)
  input = nil
  until input == "1" || input == "2" || input == "3"
    puts "Please select"
    input = gets.chomp
  end
  case input
  when "1"
    Players::RNG.new(token)
  when "2"
    Players::Computer.new(token)
  when "3"
    Players::AdvancedAI.new(token)
  end
end

def human_vs_ai
  puts "Player 1 - X :"
  puts "(1). Human"
  puts "(2). Basic AI"
  puts "(3). Intermediate AI"
  puts "(4). Advanced AI"
  input = nil
  until input.to_i.between?(1,4)
    puts "Please Select"
    input = gets.chomp
  end
  case input
  when "1"
    player_1 = Players::Human.new("X")
  when "2"
    player_1 = Players::RNG.new("X")
  when "3"
    player_1 = Players::Computer.new("X")
  when "4"
    player_1 = Players::AdvancedAI.new("X")
  end

  if input == "1"
    puts "Player 2 - O ::"
    puts "(1). Basic AI"
    puts "(2). Intermediate AI"
    puts "(3). Advanced AI"
    player_2 = create_ai("O")
  else
    puts "Player 2: Human"
    player_2 =  Players::Human.new("O")
    sleep(2)
  end

  game = Game.new(player_1, player_2)
  game.play
end

def ai_vs_ai
  stats = []
  puts "Player 1 - X :"
  puts "(1). Basic AI"
  puts "(2). Intermediate AI"
  puts "(3). Advanced AI"
  player_1 = create_ai("X")
  puts "Player 2 - O :"
  puts "(1). Basic AI"
  puts "(2). Intermediate AI"
  puts "(3). Advanced AI"
  player_2 = create_ai("O")
  puts "How many games should they play?"
  input = 0
  until input.to_i.between?(1,2000)
    puts "Please enter a number, up to 2,000"
    input = gets.chomp
  end

  game = Game.new(player_1, player_2)
  input.to_i.times do
    game.play
    stats << game.winner
    game.board.reset!
  end
  puts "X won #{stats.count("X")} and O won #{stats.count("O")}!"
end

def human_vs_human
  game = Game.new()
  game.play
end
