class TtT
  def initialize
  end

  def call
    def greeting
      # greets player, asks if they want to play, calls #wanna_play?
      puts "Welcome to Tic Tac Toe"
      puts "Would you like to play a game? (y/n)"
      wanna_play?
    end

    def wanna_play?
      # If they say yes, it calls #choose_game
      play = gets.strip
      play.downcase
      if play == 'n'
        puts "Well, maybe next time. Have a wonderful day."
        exit
      elsif play == 'y'
        puts "You've made the right choice in my book."
        choose_game
      end     
    end

    def c_vs_c
      # returns c_v_c_game.play
      cvc_game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Computer.new("O"))
      cvc_game.play
    end

    def one_player
      # returns one_player_game.play
      puts "Who wants to be X? (you/computer)"
      first = gets.strip
      first.downcase
      if first == "you"
        one_game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"))
      elsif first == "computer"
        one_game = Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"))
      else
        puts "You have to choose an option."
        one_player
      end
      one_game.play
    end

    def two_player
      # returns two_player_game.play
      puts "Who will be the first player (X)? (Enter a Name)"
      first_player = gets.strip
      puts "You go first, #{first_player}!"
      two_game = Game.new(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"))
      two_game.play
    end

    def choose_game
      # Calls c_vs_c, one_player, or two_player based on their choice
      puts "Select from the following games:"
      puts "1. Computer vs. Computer"
      puts "2. You vs. Computer"
      puts "3. You vs. Friend"
      game_type = gets.strip

      if game_type == "1"
        c_vs_c
      elsif game_type == "2"
        one_player
      elsif game_type == "3"
        two_player
      else
        puts "Not a valid option. Try again."
        choose_game  
    end
  end

  greeting
  wanna_play?
  end
end