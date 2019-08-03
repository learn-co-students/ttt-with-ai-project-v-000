

class TicTacToeCLI
  def initialize
  end

  def call
    puts "Welcome to Tic-Tac_Toe"
    puts "Please select 0 for Computer X Computer match,"
    puts "or 1 for Human X Computer match,"
    puts "or 2 for a Human X Human match!"

    i = gets.chomp
    case i
    when "0"
      @player_1 = Players::Computer.new('X')
      @player_2 = Players::Computer.new('O')

    when "1"
      @player_1 = Players::Human.new('X')
      @player_2 = Players::Computer.new('O')

    when "2"
      @player_1 = Players::Human.new('X')
      @player_2 = Players::Human.new('O')

    end

    game = Game.new(@player_1, @player_2, board = Board.new)
    until game.over?
      game.play
    end

    if game.won?
      puts "Would you like to play again? Y/N"
      if gets.strip.upcase == "Y"
        board.reset!
        game.play
      elsif
        puts "Thank you for playing!"
      end
    end

  end
end
