class Game
  attr_accessor :board, :player_1, :player_2


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board.cells[combo[0]] == @board.cells[combo[1]] &&
      @board.cells[combo[1]] == @board.cells[combo[2]] &&
      @board.taken?(combo[0]+1)
    end
  end

  def draw?
    @board.full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @board.cells[winning_combo.first]
    end
  end

  def turn
    player = current_player
    current_move = player.move(@board)
    if @board.valid_move?(current_move)
      @board.update(current_move, player)
      puts "\n"
      puts "#{player.name}('#{player.token}') moved to cell #{current_move}"
      puts "\n"
      @board.display
      puts "\n"
      puts "-----------"
      puts "-----------"
      puts "\n"
    else
      puts "\n"
      puts "Ummm...yah, what was that?"
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

    def again
      puts "\n"
      puts "Play Again? Y/N"
      input = gets.strip
    if input == "Y" || input == "y"
      start
    elsif input == "N" || input == "n"
      puts "\n"
      puts "Thank you, come again."
    elsif input != "N" && input != "n" && input != "N" && input != "n"
      again
    end
  end

  def start
    puts "\n"
    puts "Welcome to Tic-Tac-Toe"
    puts "\n"
    puts "Enter '0' for Computer vs. Computer"
    puts "Enter '1' for Computer vs. Human"
    puts "Enter '2' for Human vs. Human"
    input = gets.strip

    if input == "0"
      game = Game.new(player_1 = Players::Computer.new("X", "Computer Player 1"),  player_2 = Players::Computer.new("O", "Computer Player 2"))
      game.play
    elsif input == "1"
      puts "\n"
      puts "Enter player name:"
      name = gets.strip
      game = Game.new(player_1 = Players::Computer.new("X", "Computer"),  player_2 = Players::Human.new("O", name))
      game.play
    elsif input == "2"
      puts "\n"
      puts "Enter name of first player('X'):"
      player_1_name = gets.strip
      puts "\n"
      puts "Enter name of second player('O'):"
      player_2_name = gets.strip
      puts "\n"
      game = Game.new(player_1 = Players::Human.new("X", player_1_name), player_2 = Players::Human.new("O", player_2_name))
      game.play
    elsif !([0, 1, 2].include?(input))
      puts "\n"
      puts "I trust that was a typo...let's hope so."
      puts "No worries, we all deserve a second chance."
      puts "¡Una vez más!"
      start
    end
    again
  end
end
