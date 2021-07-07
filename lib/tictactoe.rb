class Game_Cycle
  def initialize
    puts "Welcome to Tic Tac Toe!"
    sleep(2)
    puts "How many players?"
    sleep(2)
    puts "If you select 0, I will challenge my own Tic Tac Toe skills for your amusement."
    sleep(3)
    puts "If you dare select 1, you shall test your Tic Tac Toe prowess against mine."
    sleep(3)
    puts "If you select 2, you'll play against another human."
    sleep(2)
    puts "Sounds a bit dull to me."
    sleep(4)
    puts "But what do I know, I'm just a cold-hearted machine."
    sleep(4)
    puts "So what will it be? Please enter a number between 0-2."

    player_num = gets.strip.to_i

    while !player_num.between?(0,2)
      puts "Hey, come on, a number between 0-2. I have all day, but you don't."
    end

    if player_num == 0
      computer_vs_computer
    elsif player_num == 1
      computer_vs_human
    elsif player_num == 2
      human_vs_human
    end

    new_game?
  end

  def computer_vs_computer
    puts "Me versus me. This ought to be an even match."
    sleep(5)
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    game.play
  end

  def computer_vs_human
    puts "The first player will play as X. Would you like to play as X or play as O?"
    sleep(3)
    puts "Enter X to play first, or O to play second."

    first_player = gets.strip

    if first_player == "X"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
      game.play
    elsif first_player == "O"
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
      game.play
    else
      computer_vs_human
    end
  end

  def human_vs_human
    puts "I would say you hurt my feelings..."
    sleep(2)
    puts "but I have none."
    sleep(4)
    puts "Maybe this is how the Tin Man felt."
    sleep(2)
    puts "The first player will play as X. May the best human win."
    game = Game.new(Players::Human.new("X"), Players::Human.new("O"))
    game.play
  end

  def new_game?
    puts "Would you like to play another game?"
    sleep(1)
    puts "Please enter 'Yes' for another game, or 'No' to exit."
    yn_input = gets.strip

    if yn_input == "Yes"
      Game_Cycle.new
    else
      exit
    end
  end
end
