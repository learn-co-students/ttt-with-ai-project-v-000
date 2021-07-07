class TicTacToe
  attr_accessor :user_input

  def initialize
    call
  end

  def call
    options_menu
    # self.user_input = ""
    self.user_input = gets.strip
    case self.user_input
      when "0"
        two_computers
      when "1"
        player_vs_computer
      when "2"
        two_players
      when "exit" #|| "Exit" || "e" || "EXIT"
        exit
      else
        puts "Please choose one of the below options:"
        call
      end
    end
  end

  def options_menu
    puts "Choose the type of TicTacToe you want to play!"
    puts "--> Enter 0 for a game between two computers"
    puts "--> Enter 1 for a game between you and the computer"
    puts "--> Enter 2 for a game between two players"
    puts "--> Type 'exit' to quit playing"
  end

  def two_computers
    Game.new(Players::Computer.new('X'), Players::Computer.new('O')).play
  end

  def player_vs_computer
    choice = []
    puts "Which token would you like? (Enter X or O)"
    choice[0] = gets.strip
    until %w(X x O o).include?(choice[0])
      puts "Sorry, I didn't get that."
      puts "Which token would you like? (Enter X or O)"
      choice[0] = gets.strip
    end

    player2_token = choice[0].upcase == 'X' ? 'O' : 'X'

      player_1 = Players::Human.new(choice[0].upcase)
      player_2 = Players::Computer.new(player2_token)

    Game.new(player_1, player_2).play
    puts "Do you want to play again? (Enter Y OR N)"
    choice = gets.strip
    if choice.upcase == 'Y'
      player_vs_computer
    else
      exit
    end
  end

  def two_players
    puts "Who should go first X or O? (Enter X or O)"
    choice = gets.strip
    until %w(X x O o).include?(choice)
      puts "Sorry, I didn't get that."
      puts "Who should go first X or O? (Enter X or O)"
      choice = gets.strip
    end
    player2 = choice.upcase == 'X' ? 'O' : 'X'
    Game.new(Players::Human.new(choice.upcase), Players::Human.new(player2)).play
    puts "Do you want to play again? (Enter Y OR N)"
    choice = gets.strip
    if choice.upcase == 'Y'
      two_players
    else
      exit
    ends
  end
end

# game = Game.new
# until game.won?
#   game.play
# end
#
# puts "Would you like to play again?"
# if gets.strip.downcase == "y" || 'yes'
#   game.Game.new
#   until game.won?
#     game.play
#   end
# else
# end
