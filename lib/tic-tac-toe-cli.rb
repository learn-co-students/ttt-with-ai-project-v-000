class TicTacToeCLI
  attr_accessor :answer

  def initialize
    puts "\nWelcome to Tic Tac Toe!\n\n"
    declare_players
    start_game
  end 

  def declare_players
    choices = (0..2).to_a.map(&:to_s)

    until choices.include?(answer) 
      puts "How many players? (0-2)"
      @answer = gets.strip
    end
  end

  def first_move
    input = ''
    until ['y', 'yes', 'n', 'no'].include?(input)
      puts "Would you like to go first? ('y' or 'n')"
      input = gets.strip.downcase
    end
    input
  end

  def start_game
    case answer 
    when "0"
      game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
    when "1"
      if first_move == 'y'
        game = Game.new(Player::Human.new("X"), Player::Computer.new("O"))
      else 
        game = Game.new(Player::Computer.new("X"), Player::Human.new("O"))
      end
    when "2"
      game = Game.new(Player::Human.new("X"), Player::Human.new("O"))
    end
    game.play
    TicTacToeCLI.new if play_again? == 'y'
  end

  def play_again?
    puts "\nEnter 'y' if you would like to play another game of Tic Tac Toe."
    answer = gets.strip.downcase
  end
end