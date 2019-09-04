class GameController

  def initialize
    # Game.new
  end

  def call
    puts "Welcome to the TicTacToe game!"
    puts "Choose your mode:"
    puts "1. CPU vs CPU"
    puts "2. 1 Player"
    puts "3. 2 Players"
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = ""

    while input != "exit"
      input = gets.chomp
      case input
        when "1"
          puts "CPU vs CPU game started!"
          Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
        when "2"
          start = [1,2].sample # Randomly chooses who starts
          start == 2 ? Game.new(Players::Computer.new("X")).play : Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        when "3"
          Game.new.play
      end
    end

  end
end
