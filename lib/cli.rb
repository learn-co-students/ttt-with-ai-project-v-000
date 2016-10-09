class CLI

  def initialize
    puts "Welcome to Tic Tac Toe!"
    menu
  end

  def menu
    puts "Enter number of players (1-2)"
    input = gets.strip.downcase

  case input
    when "1"
      puts "1 player game"
      Game.new(player_1=Player::Human.new("X"), player_2=Player::Computer.new("O")).play
    when "2"
      puts "2 player games"
      Game.new.play
    end
  end


end