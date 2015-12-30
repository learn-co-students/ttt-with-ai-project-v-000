class TicTacToeCLI
  attr_reader :player_1, :player_2
  def self.check_players(num=2)
    if num == 0
      @player_1 = Player::Computer.new("X")
      @player_2 = Player::Computer.new("O") 
    elsif num == 1
      puts "Do you want to go first? Y/N"
      choice_first = gets.strip 
      if choice_first == "Y"
        @player_1 = Player::Human.new("X")
        @player_2 = Player::Computer.new("O")  
      else
        @player_1 = Player::Computer.new("X")
        @player_1 = Player::Human.new("O")
      end
    end
    Game.new.player_1 = @player_1
    Game.new.player_2 = @player_2
  end 
  
end