class TicTacToeCLI

  def initialize
  end

  def call
    repeat = true
    until !repeat
      puts "Welcome to Tic Tac Toe!\n"
      puts "How many players? (\'0\' or \'1\' or \'2\')?"
      players = nil
      until (players == "0") || (players == "1") || (players == "2")
        puts "How many players?"
        players = gets.strip
      end
      if players == "2"
        game = Game.new
      elsif players == "1"
        game = Game.new(Players::Human.new("X"),Players::Computer.new("O"),Board.new)
      else
        game = Game.new(Players::Computer.new("X"),Players::Computer.new("O"),Board.new)
      end
      game.play
      again = nil
      until (again == "y") || (again == "n")
        puts "Play again? (\'y\' or \'n\')"
        again = gets.strip
      end
      if again == "n"
        repeat = false
      end
    end
  end

end
