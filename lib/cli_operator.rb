
=begin
  Its considered bad practice to use @variable instead of self.variable
  everywhere outside of their getter/setter functions. It makes it harder
  to extend these variables in the future. For example if we wanted to rename
  the variable we'd have to do it everywhere and may accidentally break
  something if the variables name is contained within something else
  (@song variable and all_songs method). Additionally if we wanted to add
  something like returning a freezed copy to a varaibles getter function or
  adding the instance variable to a collection if its below a certain value to
  its getter we'd have to find every usage of said variable and adjust as
  needed. Was this wordy enough?
=end

class TicTacToe
  attr_accessor :game_kind, :first_player, :play_again

  def play_tic_tac_toe
    puts "Welcome to a game of Tic-tac-toe!"
    puts "           "
    puts " 1 | 2 | 3 "
    puts "-----------"
    puts " 4 | 5 | 6 "
    puts "-----------"
    puts " 7 | 8 | 9 "
    puts "           "
    game_welcome
    goes_first
    new_game
    play_again?
  end

# new validation for game_welcome
  def valid_game_kind
    options = ['0', '1', '2']

    if options.include?(self.game_kind)
      self.game_kind = self.game_kind.to_i
    else
      puts 'invalid game type'
      game_welcome
    end
  end

  def game_welcome
    puts "What kind of game would you like to play: '0', '1', or '2' players?"
    self.game_kind = gets.strip
=begin
  user input validation moved here to reduce method coupling, and to adhere to
  single responsiblity principle - was originally part of new game
=end
    valid_game_kind
  end

# new validation for goes_first
  def valid_first_player
    unless self.first_player == 'HUMAN' || self.first_player == 'COMPUTER'
      puts 'invalid answer as to who goes first'
      goes_first
    end
  end

# removed the question mark from method name as it doesn't return true/false
  def goes_first
# swapped validations order as comparison of string with 0 throws an error
    if self.game_kind != "wargames" && self.game_kind > 0
# I like how you've made this a shared puts statement
      puts "Who should go first and be 'X':"
      if self.game_kind == 1
        puts "Human or Computer?"
# added upcase
        self.first_player = gets.strip.upcase
=begin
  added validation here, see reasons for game kind change and if you fail the
  first time your second answer always jumped to asking if you want to play
  again instead of actually playing
=end
        valid_first_player
      elsif self.game_kind == 2
        puts "You or Friend?"
        self.first_player = gets.strip
      end
    end
  end

  def new_game
    if self.game_kind == 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    elsif self.game_kind == 1
# changed to only match uppercase
      if self.first_player == "HUMAN"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
# changed to only match uppercase
      elsif self.first_player == "COMPUTER"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
# removed user input validation for goes_first
      end
    elsif self.game_kind == 2
# nothing to critcize here, its just a clever way of handling user input
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
    elsif self.game_kind == "wargames"
      wargames
    end
# removed user input validation for game_welcome
  end

  def play_again?
    puts "Would you like to play again? 'Y' or 'N'"
=begin
added upcase to give users a marginally easier time, and removed include to
minimize false positives
=end
    self.play_again = gets.strip.upcase
    if self.play_again == ("Y")
      play_tic_tac_toe
    elsif self.play_again == ("N")
      puts "Thanks for playing!"
    else
# added bad input notification
      puts 'invalid response'
      play_again?
    end
  end

  def wargames
# while I love the wargames movie reference it could be confusing to a user here
    x_wins = 0
    o_wins = 0
    draws = 0
    100.times do |i|
      puts "Game #{i + 1}."
      war = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      war.play
      result = war.winner
      case result
      when 'X'
        x_wins += 1
      when 'O'
        o_wins += 1
      else
        draws += 1
      end
      puts "X has won #{x_wins} times, O has won #{o_wins} times, and there have been #{draws} draws"
    end
# revised wargames message and moved it all here
    puts "WARGAMES"
    puts "Greetings Professor Falken."
    puts "A strange game. The only winning move is not to play. How about a nice game of chess?"
    answer = gets.strip.upcase
# I like having the robot poorly validate input, what do you think?
    if answer == 'Y'
      puts "Wise choice, but I don't know how to play chess yet."
      play_again?
    else
      puts "Invalid input. Access denied."
      play_again?
    end
  end

end
