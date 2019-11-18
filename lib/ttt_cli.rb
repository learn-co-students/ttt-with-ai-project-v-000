class TicTacToeCLI

  def call
    puts "Welcome to Tic Tac Toe!"
    puts "Enter your number of players (0, 1 or 2), or type exit to quit"
    input = gets.strip
    case input
    when "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    when "2"
      puts "Player 1: Please enter either 'X' or 'O' for your token."
      token_choice = gets.strip
      if token_choice.upcase == "X"
        Game.new.play
      elsif token_choice.upcase == "O"
        Game.new(Players::Human.new("O"), Players::Human.new("X")).play
      end
    when "1"
      puts "If you would like to go first, enter 1."
      puts "If you would like to go second, enter 2."
      choice = gets.strip
      if choice == "1"
        puts "Please enter either 'X' or 'O' for your token."
        token_choice_1 = gets.strip
        if token_choice_1.upcase == "X"
          Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
        elsif token_choice_1.upcase == "O"
          Game.new(Players::Human.new("O"), Players::Computer.new("X")).play
        end
      elsif choice == "2"
        puts "Please enter either 'X' or 'O' for your token."
        token_choice_2 = gets.strip
        if token_choice_2.upcase == "X"
          Game.new(Players::Computer.new("O"), Players::Human.new("X")).play
        elsif token_choice_2.upcase == "O"
          Game.new(Players::Computer.new("X"), Players::Human.new("O")).play
        end
      end
    end
    self.call unless input.downcase == "exit"
  end

end
