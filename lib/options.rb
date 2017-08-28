class Options
  attr_accessor :mode, :player_one, :player_two, :bonus_icons, :wargames_flag
  @@cpu_one_skill = []
  @@cpu_two_skill = []

  def initialize
    @bonus_icons = %w[! @ # $ % ^ & * + ~ = - < > ? : ;] #17
    @wargames_flag = false
    @@cpu_one_skill.clear
    @@cpu_two_skill.clear
  end

  def call
    puts "Press the number of the game mode you'd like:\n"
    puts "1: Human Player vs. Human Player"
    puts "2: Human Player vs. Computer Player"
    puts "3: Computer Player vs. Computer Player\n"
    #enter "wargames" to unlock the secret mode
    @mode = gets.strip

    if @mode == "1"
      puts "Human vs. Human".rjust(15)
      puts "Player 1, enter the icon you want (Default: X)"
      @player_one = gets.strip[0]
      @player_one = "X" if (@player_one == nil || @player_one == " ")
      puts "Player 2, enter the icon you want (Default: O)"
      @player_two = gets.strip[0]
      @player_two = "O" if (@player_two == nil || @player_two == @player_1 || @player_two == " ")
      Game.new(Players::Human.new(@player_one), Players::Human.new(@player_two)).play
    elsif @mode == "2"
      puts "Human vs. Computer".rjust(15)
      puts "Would you like to go first(1) or second(2)?"
      turn_choice = gets.strip.upcase
      if (%w[1 1st first].map {|i| i.upcase}).any? {|i| i == turn_choice}
        flagged_second = 0
        @player_one, @player_two = "fix", "fix"
        puts "Pick the icon you want (Default: X)"
        @player_one = gets.strip[0] unless flagged_second == 1
        @player_one = "X" if (@player_one == nil || @player_one == " ")
        cpu = "O"
        puts "Select the number for the skill level of your opponent:"
        puts "1: A monkey throwing darts at the board"
        puts "2: A skillful opponent"
#        puts "3: The Invictus-9001 Tic-Tac-Toe Supercomputer"
        Options.cpu_two_skill=(gets.strip.to_i)
      else
        puts "Pick the icon you want (Default: O)"
        @player_two = gets.strip[0]
        @player_two = "O" if (@player_two == nil || @player_two == @player_1 || @player_two == " ")
        cpu = "X"
        flagged_second = 1
        puts "Select the number for the skill level of your opponent:"
        puts "1: A monkey throwing darts at the board"
        puts "2: A skillful opponent"
#        puts "3: The Invictus-9001 Tic-Tac-Toe Supercomputer"
        Options.cpu_one_skill=(gets.strip.to_i)
      end
      if rand(1..10) > 8
        cpu = @bonus_icons[rand(@bonus_icons.size)]
        (puts "The computer has chosen to use '#{cpu}' for its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing first." ; @player_one = cpu) if @player_two.size == 1
        (puts "The computer has chosen to use '#{cpu}' for its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing second." ; @player_two = cpu) if @player_one.size == 1
      else
        (puts "The computer will use 'X' for its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing first" ; @player_one = "X") if @player_two.size == 1
        (puts "The computer will use 'O' for its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing second" ; @player_two = "O") if @player_one.size == 1
      end
      flagged_second == 0 ? Game.new(Players::Human.new(@player_one), Players::Computer.new(@player_two)).play : Game.new(Players::Computer.new(@player_one), Players::Human.new(@player_two)).play
    elsif @mode == "3"
      puts "Computer vs. Computer".rjust(15)
      rand(1..10) > 5 ? @player_one = "X" : (@player_one = @bonus_icons[rand(@bonus_icons.size)] ; @bonus_icons.delete(@player_one))
      rand(1..10) > 5 ? @player_two = "O" : @player_two = @bonus_icons[rand(@bonus_icons.size)]
      puts "Select the number for the skill level of Computer One:\n1: A monkey throwing darts at the board\n2: A skillful opponent"
      #\n3: The Invictus-9001 Tic-Tac-Toe Supercomputer
      @@cpu_one_skill << gets.strip.to_i
      puts "Select the number for the skill level of Computer Two:\n1: A monkey throwing darts at the board\n2: A skillful opponent"
      #\n3: The Invictus-9001 Tic-Tac-Toe Supercomputer
      @@cpu_two_skill << gets.strip.to_i
      puts "Computer One will use #{@player_one} as its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing first."
      puts "Computer Two will use #{@player_two} as its icon, has a skill level of #{@@cpu_two_skill[0]} and will be playing second."
      Game.new(Players::Computer.new(@player_one), Players::Computer.new(@player_two)).play
    elsif @mode.upcase == "WARGAMES"
      @wargames_flag = true
      puts "Secret Mode unlocked!"
      puts "Computer vs. Computer".rjust(15)
      rand(1..10) > 5 ? @player_one = "X" : (@player_one = @bonus_icons[rand(@bonus_icons.size)] ; @bonus_icons.delete(@player_one))
      rand(1..10) > 5 ? @player_two = "O" : @player_two = @bonus_icons[rand(@bonus_icons.size)]
      puts "Select the number for the skill level of Computer One:\n1: A monkey throwing darts at the board\n2: A skillful opponent"
      #\n3: The Invictus-9001 Tic-Tac-Toe Supercomputer
      Options.cpu_one_skill=(gets.strip.to_i)
      puts "Select the number for the skill level of Computer Two:\n1: A monkey throwing darts at the board\n2: A skillful opponent"
      #\n3: The Invictus-9001 Tic-Tac-Toe Supercomputer
      Options.cpu_two_skill=(gets.strip.to_i)
      puts "Computer One will use #{@player_one} as its icon, has a skill level of #{@@cpu_one_skill[0]}, and will be playing first."
      puts "Computer Two will use #{@player_two} as its icon, has a skill level of #{@@cpu_two_skill[0]} and will be playing second."
      Game.new(Players::Computer.new(@player_one), Players::Computer.new(@player_two), Board.new, true).play
    end
  end

  def self.cpu_one_skill
    @@cpu_one_skill
  end

  def self.cpu_one_skill=(skill)
    @@cpu_one_skill = skill
  end

  def self.cpu_two_skill
    @@cpu_two_skill
  end

  def self.cpu_two_skill=(skill)
    @@cpu_two_skill << skill
  end

  def self.end_game
    puts "Would you like to play again? (N/No/Exit/Quit to leave)"
    exeunt = gets.strip.upcase
    Options.new.call unless %w[N NO EXIT QUIT].any? {|i| i == exeunt}
  end

end
