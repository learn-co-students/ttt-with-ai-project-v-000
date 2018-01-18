class Cli
  attr_accessor :player_num, :token_first, :player_first, :p1_token, :p2_token, :p1, :p2, :game

  def num_players
    puts "Do you want to play a 0, 1, or a 2 player game?"
    @player_num = gets.strip.to_i
  end

  def first_token
    puts "Who goes first? 1) X or 2) O?"
    @token_first = gets.strip.to_i
  end

  def first_player
    puts "Okay, now who will be the first player? 1) You or 2) The Computer?"
    @player_first = gets.strip.to_i
  end

  def order
    puts "Okay! So, this will be a #{self.player_num} player(s) game of Tic-Tac-Toe. Let's get started!"
    case self.player_num
      when 1
        self.first_token
        self.first_player
      when 2 || 0
        self.first_token
    end
  end

  def set_tokens
    (@token_first == 1) ? (@p1_token, @p2_token = ["X", "O"]) : (@p1_token, @p2_token = ["O", "X"])
  end

  def set_players
    case @player_num
    when 0
      @p1, @p2 = [Players::Computer.new(@p1_token), Players::Computer.new(@p2_token)]
    when 1
      if player_first == 1
        @p1, @p2 = [Players::Human.new(@p1_token), Players::Computer.new(@p2_token)]
      elsif player_first == 2
        @p1, @p2 = [Players::Computer.new(@p1_token), Players::Human.new(@p2_token)]
      end
    when 2
      @p1, @p2 = [Players::Human.new(@p1_token), Players::Human.new(@p2_token)]
    end
  end

  def start_game
    self.num_players
    self.order
    self.set_tokens
    self.set_players
    @game = Game.new(@p1, @p2)
  end

  def run_game
    new_game = "y"
    while new_game == "y"
      self.start_game
      @game.play
      puts "Would you like to start another game? y or n"
      new_game = gets.strip.downcase
    end
    puts "Thank you for playing. Goodbye!"
  end
end
