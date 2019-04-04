class TicTacToeCLI

  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe with AI!"
    input = ""

    while input != "exit"
     puts "What kind of game do you want to play - 0, 1, or 2 players? Please enter [0], [1], or [2]!"
     num = gets.strip.to_i


      if num.to_i == 0
        player_1=Players::Computer.new("X")
        player_2=Players::Computer.new("O")

      elsif num.to_i == 1
        puts "Who wants to go first, you or the computer? Please enter [me] or [computer]!"
        first = gets.strip
        if first == "me"
          player_1=Players::Human.new("X")
          player_2=Players::Computer.new("O")
        else
          player_1=Players::Computer.new("X")
          player_2=Players::Human.new("O")
        end

      elsif num.to_i == 2
        player_1=Players::Human.new("X")
        player_2=Players::Human.new("O")
      end

      puts "Would you like to play again? Please enter [play again] or [exit]"
      input = gets.strip
    end
  end
end
