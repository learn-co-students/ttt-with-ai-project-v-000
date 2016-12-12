class Controller
  attr_accessor :game

  def start
    puts "Would you like to play a game with 0 players (computer vs. computer), 1 player (human vs. computer) or 2 players (human vs. human)? Enter a number:"
    input = gets.strip.to_i
    loop do
      case input
        when 0
          @game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
          break
        when 1
          puts "Human player, please enter your desired token:"
          token = gets.strip
          token == "O" ? comp_token = "X" : comp_token = "O" 
          @game = Game.new(Player::Human.new(token), Player::Computer.new(comp_token))
          break
        when 2
          puts "Player 1, please enter your desired token:"
          token_1 = gets.strip
          puts "Player 2, please enter your desired token:"
          token_2 = gets.strip
          @game = Game.new(Player::Human.new(token_1), Player::Human.new(token_2))
          break
        else
          puts "Please enter a valid option (0, 1, or 2):"
          input = gets.strip.to_i
      end
    end
    @game.play
    puts "Would you like to play again? Enter 'yes' or 'no':"
    input = gets.strip.downcase
    case input
      when "yes"
        start
      else 
        puts "Thanks for playing!"
    end
  end

end