class TicTacToeCLI
  def call
    puts "Welcome to Tic Tac Toe!"
    puts "What type of game would you like to play? Please select one player, two player, or no player"
    input = gets.chomp
      if input == "one player"
        puts "Who should be X-you or the computer? Type 'you' or 'computer'"
        second_input = gets.chomp
          if second_input == "you"
            game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          elsif second_input == "computer"
            game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          end
      elsif input == "no player"
        game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
      elsif input == "two player"
        game = Game.new(Players::Human.new("X"),Players::Human.new("O"),Board.new)
      end
      game.play
    end
end
