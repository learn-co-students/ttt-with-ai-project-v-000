class TicTacToeCLI
  def start
    puts "Welcome to TicTacToe with Artificial Intelligence!"
    puts "Please enter 0, 1, or 2 to indicate the number of players who will participate."
    player_count = gets.strip
    if player_count == "0"
      puts "Two computers will now compete!"
      computer_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
      computer_game.play
    elsif player_count == "1"
      puts "TicTacToe faceoff between a human and a computer!"
      puts "Enter X to be player X and make the first move."
      puts "Enter O to be player O and make the second move."
      player_identity = gets.strip.upcase
      if player_identity == "X"
        human_versus_machine = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
        human_versus_machine.play
      else
        human_versus_machine = Game.new(Players::Computer.new("X"), Players::Human.new("O"))
        human_versus_machine.play
      end
    elsif player_count == "2"
      puts "Two humans will now compete! The first player is automatically assigned token X by default."
      human_game = Game.new
      human_game.play
    else
      puts "The input you entered is invalid. Goodbye!"
    end
  end

  def initialize
    play_now = "yes"
    until play_now == "no"
      start
      puts "Would you like to play again? Type 'yes' to play another round of TicTacToe or type 'no' to exit the game."
      play_now = gets.strip.downcase
    end
    puts "Hope you enjoyed playing TicTacToe! Goodbye for now!"
  end
end
