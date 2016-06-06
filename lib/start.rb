class StartTheGame

  def initialize
    puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to Tic Tac Toe! *~*"
    puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*"
    game_type
    start
  end

  def game_type
    puts "\nPlease choose the type of game to play"
    puts "0 - Computer vs Computer"
    puts "1 - Human vs Computer"
    puts "2 - Human vs Human"
    puts "3 - Wargames"
    @game_choice = gets.strip
  end

  def start
    case @game_choice
    when "0"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O")).play
      play_again?
    when "1"
      puts "\nPlayer 1, choose your token: X or 0? X will go first."
      token_input = gets.strip.upcase
      if token_input == "X"
        Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
      elsif token_input == "O"
        Game.new(Player::Computer.new("X"), Player::Human.new("O")).play
      else
        exit
      end
      play_again?
    when "2"
      puts "\nPlayer 1, choose your token: X or 0? X will go first."
      token_input = gets.strip
      if token_input == "X"
        Game.new(Player::Human.new("X"), Player::Human.new("O")).play
      elsif token_input == "O"
        Game.new(Player::Human.new("O"), Player::Human.new("X")).play
      else
        exit
      end
      play_again?
    when "3"
      puts "\nThe computer will now play itself 100 times"
      sleep 1
      100.times do
        Game.new(Player::Computer.new("X"), Player::Computer.new("O")).play
      end
      play_again?
    end
  end
    
  def play_again?
    puts "\nDo you want to play again? (yes/no)"
    answer = gets.strip.downcase
    if answer == "yes"
      game_type
      start
    elsif answer == "no"
      puts "\n"
      puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*~*~*~*~*"
      puts "*~* Thanks for playing Tic Tac Toe! *~*"
      puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*~*~*~*~*"
      exit
    else
      play_again?
    end
  end
  
end