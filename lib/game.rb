class Game < Dry_Helpers
#======================================modules========================================
  include Players
  extend Modes
#=====================================properties======================================
  attr_accessor :player_1, :player_2, :board
#=====================================intialize=======================================
  def initialize(p1 = Players::Human.new("X".green), p2 = Players::Human.new("O".red), board = Board.new)
    self.player_1 = p1; self.player_2 = p2; self.board = board
  end
#====================================game_states======================================
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
#=====================================================================================
  def won?
    WIN_COMBINATIONS.find{|c| cell[c[0]] == cell[c[1]] && cell[c[0]] == cell[c[2]] && cell[c[0]] != " "}
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end
#========================================CLI==========================================
  def self.start
    puts "Welcome To Tic Tac Toe!".cyan
    puts "Please Enter Game Mode To Start".green
    puts "Spectator:"+" 0".green
    puts "You vs Computer:"+" 1".green
    puts "Player vs Player:"+" 2".green
    puts "TO GO NUCLEAR ENTER:".red+" 'war games'".yellow
    choose_mode
  end

  def self.choose_mode
    self.mode = gets.strip
    until self.mode == "valid"
      case self.mode
      when "0"
        self.spectator
      when "1"
        self.vs_computer
      when "2"
        self.player_vs_player
      when "war games"
        self.wargames
      else
        self.mode_error!
      end
    end
  end

  def play
    while !over? && !draw?; turn end
    if won? then puts "Congratulations #{winner}!".green
    elsif draw? then puts "It's A Draw!!".yellow end
  end
#=====================================WAR GAMES=======================================  
  def play_war
    won = 0
    games = 0
    5.times do 
      while !over? && !draw?; turn end
      if won?
        won += 1
        board.reset!
        games += 1
        turn if games < 5
      elsif draw? then 
        board.reset!
        games += 1
        turn if games < 5
      end
    end
    puts "GAME WAS WON #{won} TIMES!".green 
  end
#=====================================================================================
  def self.play_again?
    ans = nil
    until ans == "n" do
      puts "WOULD YOU LIKE TO PLAY AGAIN?".cyan
      puts "Enter (y/n)".green
      ans = gets.strip
      case ans
      when "y"
        sleep(0.3)
        start
      when "n"
        return puts "THANKS FOR PLAYING! COME BACK SOON!".cyan
      else
        play_again_error!
      end
    end
  end
#=====================================================================================
end
