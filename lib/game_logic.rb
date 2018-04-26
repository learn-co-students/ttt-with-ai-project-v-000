class TicTacToe

  def initialize
    welcome
  end

  def welcome
    puts "Welcome to text-based Tic Tac Toe, a game format so old you probably forgot it ever existed!".yellow
    puts "*********************************************************************".blue
    puts "How many of you humans will be playing today?".yellow
    puts ""
    puts "0:".blue + " Watch two brilliant AIs duke it out to a bloody final conclusion.".yellow
    puts "1:".blue + " You test your wits against mine.  Who knows?  You might even win.".yellow
    puts "...".blue
    puts "Probably not, though.".blue
    puts "2:".blue + " Hey, you conned a friend into playing this with you!".yellow
    puts "*********************************************************************".blue
    user_input
  end

  def user_input
    puts "This is when you enter a number between 0 and 2.".red
    user_input = gets.strip.to_i
    if user_input == 0
      computer_vs_computer
    elsif user_input == 1
      human_vs_computer
    elsif user_input == 2
      human_vs_human
    else
      puts "Hey, your hand slipped there, buddy.  Please try again.".red
      self.user_input
    end
  end

  def computer_vs_computer
    game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"))
    game.board.display
    game.play
    game.board.display

    puts "My my, wasn't that a scintillating experience?".red
    puts "You want more action? Y/N".red

    fleshbag_input = gets.strip.upcase
    if fleshbag_input == "Y"
      puts "You got it, buddy!".red
      user_input
    end
  end

  def human_vs_computer
    puts "Are you gracious enough to let the computer go first? Remember, player one is always X.".red
    puts "Y/N"
      player_input = gets.strip.upcase
      if player_input == "Y"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"))
        game.board.display
        game.play
      elsif player_input == "N"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"))
        game.board.display
        game.play
      end
      game.board.display
      puts "Wanna go again, chump? Y/N".red
      fleshbag_input = gets.strip.upcase
      if fleshbag_input == "Y"
        user_input
      end
    end

  def human_vs_human
    puts "Okay, ".yellow + "human scum".red + ".  Let's get this thing started.".yellow
    puts "Whichever one of you fleshbags goes first will be X.".yellow
    puts "Either way, one of you will".yellow + " die a glorious death in battle.".red
    puts "Or not.  Tic Tac Toe usually ends in a boring draw.".yellow
      game = Game.new
      game.board.display
      game.play
      game.board.display
    puts "Wanna play again, my bronuts? Y/N".red
      fleshbag_input = gets.strip.upcase
      if fleshbag_input == "Y"
        user_input
      end
    end

end
