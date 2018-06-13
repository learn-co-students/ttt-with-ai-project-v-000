class PlayerMaker

  def self.get_player(player_number)
    puts "would you like player #{player_number} to be AI or human?"
    self.get_player_type(gets.strip.downcase, self.get_token(player_number))
  end

  def self.get_token(player_number)
    player_number % 2 == 0 ? "O" : "X"
  end

  def self.get_player_type(player_type, player_token)
    case player_type
    when "ai"
      Players::Computer.new(player_token)
    when "human"
      Players::Human.new(player_token)
    else
      puts "please enter a valid choice, caps insensitive, AI or human"
      get_player_type(gets.strip.downcase, player_token)
    end
  end
end
