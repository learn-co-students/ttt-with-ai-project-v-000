class TicTacToeController

  def start
    input = ""

    while input != "exit"
      puts "Welcome to Tic Tac Toe!"
      puts "How many players today? 0, 1, or 2?"
      puts "To exit, type exit."

      input = gets.strip

      case input
      when "0"
        zero_player_game
      when "1"
        one_player_game
      when "2"
        two_player_game
      end
    end
  end

  def zero_player_game
    Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    start if new_game
  end

  def one_player_game
    puts "Which token would you like to be? X or O?"
    input = gets.strip.upcase
    if input == "X"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new).play
    elsif input == "O"
      Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Computer.new("X"), board = Board.new).play
    else
      puts "Invalid input."
      start
    end
    start if new_game
  end

  def two_player_game
    puts "Player 1 will go first. Please choose X or O."
    input = gets.strip.upcase
    if input == "X"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new).play
    elsif input == "O"
      Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"), board = Board.new).play
    else
      puts "Invalid input."
      start
    end
    start if new_game
  end

  def new_game
    puts "Shall we go again? Please input 'yes' or 'no'"
    input = gets.strip
    if input == "yes"
      start
    elsif input == "no"
      puts "Come back soon!"
      exit
    end
  end
end
