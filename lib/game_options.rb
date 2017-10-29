class GameOptions
  include Players
  attr_accessor :option_input, :who_goes_first, :computer_vs_computer

  def initialize
    game_option

  end

  def start_game
    if @computer_vs_computer
      game = Game.new(Computer.new("X"), Computer.new("O"))
      game.play
    elsif @option_input == 2 && @who_goes_first == 1
      game = Game.new(Computer.new("X"), Human.new("O"))
      game.play
    elsif @option_input == 2 && @who_goes_first == 2
      game = Game.new(Human.new("X"), Computer.new("O"))
      game.play
    else
      game = Game.new(Human.new("X"), Human.new("O"))
      game.play
    end

  end

  def game_option
    puts "Select game option:
      1 - Computer vs Computer
      2 - You vs Computer
      3 - You vs another Player
      --------------------------"
      input = gets.strip
      if input.to_i == 1
        @computer_vs_computer = true
        start_game
      elsif input.to_i == 3
        start_game
      elsif input.to_i == 2
        @option_input = input.to_i
        who_goes_first
      else
        puts "#{input} is an invalid entry."
        game_option
      end
    end

  def who_goes_first

    if @option_input == 2
      puts "Who do you want to go first and be X:
        1 - Computer
        2 - You
        ------------"
      end
      input = gets.strip
      if input.to_i == 1 || input.to_i == 2
        @who_goes_first = input.to_i
        start_game
      else
        puts "#{input} is an invalid entry."
        who_goes_first
      end
    end

end
