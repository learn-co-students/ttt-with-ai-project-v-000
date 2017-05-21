class TicTacToeGame

  def initialize
  end

  def start
    puts " "
    puts "               |         |        "
    puts "           W  E  L  C  O  M  E    "
    puts "               |         |        "
    puts "       --------+---------+--------"
    puts "               |         |        "
    puts "               |   T O   |        "
    puts "               |         |        "
    puts "       --------+---------+--------"
    puts "               |         |        "
    puts "        T I C  |  T A C  |  T O E "
    puts "               |         |        "

    puts " "
    puts "__________________________________________"
    puts " "


    puts "  How Many Players? Choose from 0, 1, 2:"
    input = gets.strip.to_i
    if input.between?(0, 2) && input == 0
      game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
    elsif input.between?(0, 2) && input == 1
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
      game.play
    elsif input.between?(0, 2) && input == 2
      game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      game.play
    else
      puts "  Please enter valid number of players!"
    end
  end

end
