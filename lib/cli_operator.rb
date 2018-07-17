
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

  def game_welcome
    puts "What kind of game would you like to play: '0', '1', or '2' players?"
    self.game_kind = gets.strip
    valid_game_kind
  end

  def valid_game_kind
    options = ['0', '1', '2']

    if options.include?(self.game_kind)
      self.game_kind = self.game_kind.to_i
    else
      puts 'invalid game type'
      game_welcome
    end
  end

  def goes_first
    if self.game_kind != "wargames" && self.game_kind > 0
      puts "Who should go first and be 'X':"
      if self.game_kind == 1
        puts "Human or Computer?"
        self.first_player = gets.strip.upcase
        valid_first_player
      elsif self.game_kind == 2
        puts "You or Friend?"
        self.first_player = gets.strip
      end
    end
  end

  def valid_first_player
    unless self.first_player == 'HUMAN' || self.first_player == 'COMPUTER'
      puts 'invalid answer as to who goes first'
      goes_first
    end
  end

  def new_game
    if self.game_kind == 0
      Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
    elsif self.game_kind == 1
      if self.first_player == "HUMAN"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      elsif self.first_player == "COMPUTER"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
    elsif self.game_kind == 2
      Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
    elsif self.game_kind == "wargames"
      wargames
    end
  end

  def play_again?
    puts "Would you like to play again? 'Y' or 'N'"
    self.play_again = gets.strip.upcase
    if self.play_again == ("Y")
      play_tic_tac_toe
    elsif self.play_again == ("N")
      puts "Thanks for playing!"
    else
      puts 'invalid response'
      play_again?
    end
  end

  def wargames
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
    puts "WARGAMES"
    puts "Greetings Professor Falken."
    puts "A strange game."
    puts 'The only winning move is not to play.'
    puts 'How about a nice game of chess?'
    answer = gets.strip.upcase
    if answer == 'Y'
      puts "Wise choice, but I don't know how to play chess yet."
      play_again?
    else
      puts "Invalid input. Access denied."
      play_again?
    end
  end

end
