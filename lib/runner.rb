require 'pry'

# The Runner Class is responsible for executing the game. It start's the game and allows the user to
# select a game_mode to being. Team tokens are automatically generated through #team_picker. After a game completes,
# players have an option of starting a new game (generating a new Game.)

class Runner

  def start #start the game
    puts "Welcome to Tic Tac Toe! Please select your game mode:"
    game = game_mode_select(game_mode)
    new_game?
  end

  def game_mode #receives the user's game mode selection
    puts "   1.  Machines: Pits 2 AI's against each other."
    puts "   2.  Man v. Machine: Human player v. AI."
    puts "   3.  Deathmatch: Battle a friend."
    puts "   4.  War Games: Pits 2 AI's against each other in a 101 round series."
    puts "Select 1, 2, 3, or 4."
    input = gets.chomp
  end

  def game_mode_select(input) #starts the game based on the user's game_mode input
    answers = [1,2,3,4]
    team = team_picker
    until answers.include?(input)
      case input.to_i
      when answers[0] #AI game
        game = Game.new(Computer.new(team[0]), Computer.new(team[1]), Board.new)
        return game.play
      when answers[1] #human vs #AI
        game = Game.new(Human.new(team[0]), Computer.new(team[1]), Board.new)
        return game.play
      when answers[2] #human v human
        game = Game.new(Human.new(team[0]), Human.new(team[1]), Board.new)
        return game.play
      when answers[3] #see war_games
        return war_games
      else 
        puts "Please make a valid selection."
      end
      input = gets.chomp
    end
  end

  def war_games #101 series match that generates the wins for user to see
    i = 0
    wins = []
    until i > 100 #start the game loop
      team = team_picker
      war_game = Game.new(Computer.new(team[0]), Computer.new(team[1]), Board.new)
      war_game.play
      wins << war_game.winner #add winner to the wins array so we can count later - see below
      i += 1
    end
    x_wins = wins.count {|win| win == "X"}
    o_wins = wins.count {|win| win == "O"}
    draws = wins.count {|win| win == false}
    puts "   X Wins: #{x_wins}"
    puts "   O Wins: #{o_wins}"
    puts "   Draws: #{draws}"
    if x_wins > o_wins
      puts "   X wins with #{x_wins} matches won!"
      else
      puts "   O wins with #{o_wins} matches won!"
    end
  end

  def team_picker #randomly generate the player tokens
    team = rand(0..1)
    players = []
    if team == 0 
      players[0] = "X"
      players[1] = "O"
    else
      players[0] = "O"
      players[1] = "X"
    end
    players
  end

  def new_game? #lets the user restart the game
    puts "Play again? y/n"
    input = gets.chomp
    if input == "yes" || input == "y" 
      start
    else
      puts "Thanks for playing!"
    end
  end

end