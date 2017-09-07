

class Start
  attr_accessor :players, :token

  def initialize()
    set_up
  end

  def set_up
    puts "Welcome to Tic Tac Toe"
    puts "\n"
    puts "****************"
    puts "\n"
    puts "What kind of game would you like to play?"
    game_type
  end

  def token_assign(players)
    puts "Please select a token"
    token = $stdin.gets.strip.upcase
    token == "X" || token = "O" ? token : token_assign
  end


  def game_type
    puts "0 player (Computer match), 1 player, or 2 player"
    type = $stdin.gets.strip.slice(/\d/).to_i
    # binding.pry
    if (0..2).include?(type)
    @players = type
    else
      puts "Invalid"
      puts "\n"
      game_type
    end

  end

  def order
    puts

    # Greeting
    #
    # assign token
    #
    # token validation
    #
    # determine how many players
    #
    # def game_type
    #
    #   if token == "X"
    #     Game.new(player_1=Players::Human.new("X"), player_2=Players::Computer.new("O"), board=Board.new)
    #   elsif token == "O"
    #     Game.new(player_1=Players::Computer.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    #   else
    #     puts "SELECT A VALID TOKEN, X OR O"
    #   end
    # end

end    # End of Class
