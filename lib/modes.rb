module Modes
#=================properties===================
  attr_accessor :mode
#==================spectator===================
  def spectator
    self.mode = "valid"
    puts "COMPUTER vs COMPUTER... GAME STARTING IN 3..2..1!".cyan
    sleep(2)
    Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
  end
#================vs_computer===================
  def vs_computer
    self.mode = "valid"
    puts "YOU vs COMPUTER... WOULD YOU LIKE TO GO FIRST?".cyan
    puts "Enter (y/n)".green
    ans = gets.strip
    case ans
    when "y"
      vs_computer_start
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    when "n"
      vs_computer_start
      Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
    else
      play_first!
    end
  end

  def vs_computer_start
    puts "GAME STARTING... GOOD LUCK!".cyan
    sleep(2)
  end
#==============player_vs_player================
  def player_vs_player
    self.mode = "valid"
    puts "PLAYER vs PLAYER... MAY THE BEST MAN WIN!".cyan
    sleep(2.5)
    Game.new.play
  end
#===================errors=====================
  def mode_error!
    puts "\n Invalid Entry Please Enter 0, 1, or 2 \n".colorize(color: :white, background: :red)
    sleep(0.3)
    self.start
  end

  def play_first!
    puts "\n Invalid Entry Please Enter y or n \n".colorize(color: :white, background: :red)
    sleep(0.3)
    self.vs_computer
  end

  def play_again_error!
    puts "\n Invalid Entry Please Enter y or n \n".colorize(color: :white, background: :red)
    sleep(0.3)
  end
#==============================================
end
