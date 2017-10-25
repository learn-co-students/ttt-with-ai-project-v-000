
class TicTacToeCLI

  def initialize
  end

  def call

    puts "\n\nWelcome to Tic Tac Toe!\n\n"

    players = user_inputs_players

    if players == "wargames"
      wargames
    elsif players == "0"
      computer_vs_computer
    elsif players == "1"
      human_vs_computer
    elsif players == "2"
      human_vs_human
    end

  end

  ##### Background methods #####

  def user_inputs_players

    puts "How many human players are playing? (0, 1, or 2)\n\n"

    input = gets.strip

    if input == "wargames"
      input
    elsif input != "0" && input != "1" && input != "2"
      puts "Please enter a correct amount!"
      user_inputs_players
    else
      input
    end

  end

  def computer_vs_computer

    bot1 = Players::Computer.new("X")
    bot2 = Players::Computer.new("O")
    board = Board.new
    game = Game.new(bot1, bot2, board)
    game.play

  end

  def user_picks_token

    puts "\nPlayer 1, which token would you like to use? (X or O)\n\n"

    token_input = gets.strip

    unless token_input == "x" || token_input == "X" || token_input == "o" || token_input == "O"
      puts "Sorry, invalid entry."
      user_picks_token
    else
      token_input.capitalize
    end

  end

  def alt_token(token)

    token == "X" ? "O" : "X"

  end

  def human_vs_computer

    p1_token = user_picks_token
    p2_token = alt_token(p1_token)
    human = Players::Human.new(p1_token)
    bot = Players::Computer.new(p2_token)
    board = Board.new
    puts "\n\n"
    game = Game.new(human, bot, board)
    game.play

  end

  def human_vs_human

    p1_token = user_picks_token
    p2_token = alt_token(p1_token)
    human1 = Players::Human.new(p1_token)
    human2 = Players::Human.new(p2_token)
    board = Board.new
    puts "\n\n"
    game = Game.new(human1, human2, board)
    game.play

  end

  def wargames

    x_victories = 0
    o_victories = 0
    draws = 0
    game_counter = 0

    while game_counter < 100
      victor = computer_vs_computer
      if victor == "X"
        x_victories += 1
      elsif victor == "O"
        o_victories += 1
      elsif victor == nil
        draws += 1
      end
      game_counter += 1
    end

    puts "\n\nThe computer played itself 100 times..."
    puts "X won #{x_victories} times. O won #{o_victories} times."
    puts "There was a draw #{draws} times."

  end

end
