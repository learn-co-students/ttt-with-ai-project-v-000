class CLI
  def start
    puts "Lets..."
    sleep 0.5
    puts "play..."
    sleep 0.5
    puts "Tic..."
    sleep 0.5
    puts "Tac..."
    sleep 0.5
    puts "...TOE!"
    sleep 0.5

    puts %q[
    ___________  __        __
    \__    ___/ |__| _____/  |______    ____
        |    |   |  |/ ___\   __\__  \ _/ ___\
        |    |   |  \  \___|  |  / __ \  \___
        |____|   |__|\___  >__| (____  /\___  >
                        \/          \/     \/]
    puts""

    another_round = ""

    until another_round.downcase == "n" || another_round.downcase == "no"
      puts <<~EOF
        Please select...
        0. Terminator vs. Robocop (AI vs AI)
        1. Neo vs. Agent Smith    (Human vs AI)
        2. Rocky vs. Ivan         (Human vs Human)
      EOF
      reply = gets.strip

      if reply.to_i < 0 || reply.to_i > 3
        reply = gets.strip
      elsif reply.to_i == 0
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      elsif reply.to_i == 1
        puts "Who will go first? (enter Human or AI)"
        reply = gets.strip
        if reply == "Human"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
          puts "You are player X!"
        elsif reply == "AI"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
          puts "You are player O!"
        end
        game.play until game.over?
      elsif reply.to_i == 2
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
        puts "Player 1 is X. Player 2 is O"
      end
      game.play until game.over?
      puts "Game Over. Another Round? (enter Yes or No)"
      another_round = gets.strip
    end
  end
end