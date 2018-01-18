class TicTacToeCLI
  def initialize
  end

  def call
    again = "y"

    while again == "y"
      puts "Welcome to Tic-Tac-Toe!"
      puts "Please enter the number of Human players; 0, 1, or 2:"
      players = gets.chomp

      case players
      when "0"
        ttt = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      when "1"
        puts "Would you like to be player 1 (enter 'X') or player 2 (enter 'O')?"
        input = gets.chomp
        if input == 'X'
          ttt = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
        else
          ttt = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
        end
      when "2"
        ttt = Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new)
      end

      ttt.play

      puts "Would you like to play again y/n?"
      again = gets.chomp
    end
  end
end
