module Modes
#===========================================properties=============================================
  attr_accessor :mode
#============================================SPECTATOR=============================================
  def spectator
    self.mode = "valid"
    puts "COMPUTER vs COMPUTER... GAME STARTING IN 3..2..1!".cyan
    sleep(2)
    Game.new(Players::Joshua.new("X".red), \
    Players::Joshua.new("O".yellow)).play
  end
#==========================================VS_COMPUTER=============================================
  def vs_computer
    self.mode = "valid"
    puts "YOU vs COMPUTER... WOULD YOU LIKE TO GO FIRST?".cyan
    puts "Enter (y/n)".green
    input = gets.strip
    case input
    when "y"
      vs_computer_start
      Game.new(Players::Human.new("X".green), \
      Players::Joshua.new("O".red)).play
    when "n"
      vs_computer_start
      Game.new(Players::Joshua.new("X".red), \
      Players::Human.new("O".green)).play
    else
      play_first!
    end
  end

  def vs_computer_start
    puts "GAME STARTING... GOOD LUCK!".cyan
    sleep(3)
  end
#========================================PLAYER_VS_PLAYER==========================================
  def player_vs_player
    self.mode = "valid"
    puts "PLAYER vs PLAYER... MAY THE BEST MAN WIN!".cyan
    sleep(3)
    Game.new.play
  end
#============================================WARGAMES==============================================
  def wargames
    self.mode = "valid"
    puts "WAR GAMES!!!".red + " ☠" + " INITIATING IN 3..2..1!".red
    sleep(3)
    Game.new(Players::Joshua_War.new("X".red), \
    Players::Joshua_War.new("O".red)).play_war
  end
#=============================================ERRORS===============================================
  def mode_error!
    puts "\n Invalid Entry Please Enter 0, 1, 2 or 'war games' \n".colorize(color: :white, background: :red)
    sleep(0.2)
    self.start
  end

  def play_first!
    puts "\n Invalid Entry Please Enter y or n \n".colorize(color: :white, background: :red)
    sleep(0.2)
    self.vs_computer
  end

  def play_again_error!
    puts "\n Invalid Entry Please Enter y or n \n".colorize(color: :white, background: :red)
    sleep(0.2)
  end
#==================================================================================================
end
