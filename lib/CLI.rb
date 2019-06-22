class CLI
  attr_accessor :game


  def initialize
    start
  end

  def start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players? 0, 1, or 2?"
    input = gets.strip.to_i

    if input == 0
      computer_vs_computer
    elsif input == 1
      computer_vs_human
    elsif input == 2
      human_vs_human
    end
    game.play #can call lower case because we defined it up there
  end

  def computer_vs_computer
    puts "Which Computer should go first? 1 or 2?"
    answer = gets.strip.to_i
    if answer == 1
      @game = Game.new(player_uno = Players::Computer.new("X"), player_dos = Players::Computer.new("O"))
    else
      @game = Game.new(player_uno = Players::Computer.new("O"), player_dos = Players::Computer.new("X"))
    end
  end

  def computer_vs_human
    puts "Which should go first? Computer or human?"
    answer = gets.strip.to_i
    if answer == "Computer"
      @game = Game.new(player_uno = Players::Computer.new("X"), player_dos = Players::Human.new("O"))
    else
      @game = Game.new(player_uno =Players::Human.new("O"), player_dos = Players::Computer.new("X"))
    end
  end

  def human_vs_human
    puts "Which player should go first? 1 or 2?"
    answer = gets.strip.to_i
    if answer == 1
      @game = Game.new(player_uno = Players::Human.new("X"), player_dos = Players::Human.new("O"))
    else
      @game = Game.new(player_uno = Players::Human.new("O"), player_dos = Players::Human.new("X"))
    end
  end



end
