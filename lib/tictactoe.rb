class Game_Cycle
  def initialize
    puts "Welcome to Tic Tac Toe!"
    puts "How many players?"
    puts "If you select 0, I will challenge my own Tic Tac Toe skills for your amusement."
    puts "If you dare select 1, you shall test your Tic Tac Toe prowess against mine."
    puts "If you select 2, you'll play against another human."
    puts "Sounds a bit dull to me."
    puts "But what do I know, I'm just a cold-hearted machine."
    puts "So what will it be? Please enter a number between 0-2."

    input = gets.strip.to_i

    while !input.between?(0,2)
      puts "Hey, come on, a number between 0-2. I have all day, but you don't."
    end

    if input == 0
      computer_vs_computer
    elsif input == 1
      computer_vs_human
    elsif input == 2
      human_vs_human
    end

    new_game?
  end

  def computer_vs_computer
    puts "Me versus me. This ought to be an even match."
    Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
  end

  def computer_vs_human
    puts "The first player will play as X. Would you like to play as X or play as O?"
    puts "Enter X to play first, or O to play second."

    first_player = gets.strip

    if first_player == "X"
      Game.new(Players::Human.new("X"), Players::Computer.new("O"))
    elsif first_player == "O"
      Game.new(Players::Computer.new("X"), Players::Human.new("O"))
    else
      computer_vs_human
    end
  end

  def human_vs_human
    puts "I would say you hurt my feelings,"
    puts "but I have none."
    puts "Maybe this is how the Tin Man felt."
    puts "The first player will play as X. May the best human win."
    Game.new(Players::Human.new("X"), Players::Human.new("O"))
  end

  def new_game?
    puts "Would you like to play another game?"
    puts "Please enter 'Yes' for another game, or 'No' to exit."
    yn_input = gets.strip

    if yn_input == "Yes"
      Game_Cycle.new
    else
      exit
    end
  end
end
