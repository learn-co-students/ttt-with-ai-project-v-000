class Ui

  def menu
    puts "Lets..."
    sleep 1
    puts "play..."
    sleep 1
    puts "Tic..."
    sleep 1
    puts "Tac..."
    sleep 1
    puts "...TOE!"
    sleep 1

    puts %q[
    ___________  __        __
    \__    ___/ |__| _____/  |______    ____
       |    |   |  |/ ___\   __\__  \ _/ ___\
       |    |   |  \  \___|  |  / __ \  \___
       |____|   |__|\___  >__| (____  /\___  >
                        \/          \/     \/]
    puts""

    puts <<~EOF

      Please select...
      1. 0 Players (AI vs AI)
      2. 1 Player (Human vs AI)
      3. 2 Player (Human vs Human)

    EOF

    input = gets.strip.to_i

    if input == 1
      ai_vs_ai
    elsif input == 2
      human_vs_ai
    elsif input == 3
      human_vs_human
    end
  end

  def start_board
    puts <<~EOF

     1 | 2 | 3
    -----------
     4 | 5 | 6
    -----------
     7 | 8 | 9

    EOF
  end

  def ai_vs_ai
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    start_board
    game.play
  end

  def human_vs_ai
    puts "Choose X or O"
    token = gets.strip.downcase
    if token == "x"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    else
      game = Game.new(Players::Human.new("O"), Players::Computer.new("X"))
    end
    start_board
    game.play
  end

  def human_vs_human
    puts "Which token would Player 1 like, X or O?"
    token = gets.strip.downcase
    if token == "o"
      game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
    else
      game = Game.new
    end
    start_board
    game.play
  end
end
