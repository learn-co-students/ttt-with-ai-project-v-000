
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
    goes_first?
    new_game
    play_again?
  end

  def game_welcome
    puts "What kind of game would you like to play: '0', '1', or '2' players?"
    self.game_kind = gets.strip.to_i
  end

  def goes_first?
    if self.game_kind > 0 && self.game_kind != "wargames"
      puts "Who should go first and be 'X':"
      if self.game_kind == 1
        puts "Human or Computer?"
        self.first_player = gets.strip
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
        if self.first_player == "Human"
          Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
        elsif self.first_player == "Computer"
          Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
        else
          goes_first?
        end
      elsif self.game_kind == 2
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      elsif self.game_kind == "wargames"
        wargames
      else
        puts "Invalid input. Please enter '0', '1', or '2'."
        self.game_kind = gets.strip.to_i
        game_welcome
      end
    end

    def play_again?
      puts "Would you like to play again? 'Y' or 'N'"
      self.play_again = gets.strip
      if self.play_again.include?("Y")
        play_tic_tac_toe
      elsif self.play_again.include?("N")
        puts "Thanks for playing!"
      else
        play_again?
      end
    end

    def wargames
      puts "WARGAMES"
      puts "But Professor Falken, wouldn't you rather play a nice game of chess? 'Y' or 'N'?"
      answer = gets.strip
      if answer == 'N'
        puts "           "
        puts " 1 | 2 | 3 "
        puts "-----------"
        puts " 4 | 5 | 6 "
        puts "-----------"
        puts " 7 | 8 | 9 "
        puts "           "
        w = 0
        d = 0
        100.times do |i|
          puts "Game #{i + 1}."
          war = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
          war.play
        #  binding.pry
        #  if war.won?
        #    puts "Win #{w + 1}"
        #    w += 1
        #    war = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
        #  elsif war.draw?
        #    puts "Draw #{d + 1}"
        #    d += 1
        #    war = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new).play
        #  end
        end
        puts "Greetings Professor Falken"
        puts "A strange game."
        puts "The only winning move is not to play."
      elsif answer == 'Y'
        puts "Wise choice, but I don't know how to play chess yet."
        self.play_tic_tac_toe
      else
        puts "Invalid input. Access denied."
        self.play_tic_tac_toe
      end
    end

end
