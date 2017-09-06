class TicTacToeCLI

  def initialize
  end

  def call
    rematch = ""
    until rematch == "n"
      puts "Welcome to Tic Tac Toe!"
      puts "Would you like to play a 0, 1, or 2 person game?"

      input = gets.strip

      if input == "0"
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
        game.play
        game.board.reset!

      elsif input == "1"
        puts "Do you want to be 'X' or 'O'?"
        token = gets.strip.upcase
        if token == "X"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
        else
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
        end
        game.play
        game.board.reset!

      elsif input == "2"
        game = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
        game.play
        game.board.reset!
      end

      puts "Would you like to play again? If so, enter 'y', otherwise enter 'n'."
      rematch = gets.strip
    end
  end
end
