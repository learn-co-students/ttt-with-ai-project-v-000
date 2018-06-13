class PlayerMaker
  attr_accessor :name

  def initialize(name = "foo")
    @name = name
  end

  def get_player
    player_type = gets.strip.downcase
    while player_type != "ai" && player_type != "human"
      puts "please enter a valid choice, caps insensitive, AI or human"
      player_type = gets.strip.downcase
    end
  end
end
