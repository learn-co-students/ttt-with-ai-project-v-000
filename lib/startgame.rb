class CLI

  def start
    play = ""
    until play == "no"
      puts "Hello there! Welcome to my Tic Tac Toe game!"
      puts "Enter 1 to play against another player"
      puts "Enter 2 to play against the computer"
      puts "Enter 3 for computer vs computer"

      input = gets.strip

      case
      when input == "1"
          game = Game.new
          game.play

        when input == "2"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          game.play

        when input == "3"
          game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
          game.play
      end

      puts "Play again?(yes/no) "
      play = gets.strip
    end
  end
end
