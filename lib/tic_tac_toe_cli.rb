class TicTacToeCli

  def initialize
  end

  def call
    puts "Welcome to Tic Tac Toe"

    puts "How many players are joining? (0, 1 or 2)"
    player_number = gets.strip

    puts "Player one, pick X or O"
    player_one_token = gets.strip


    if player_one_token == "X" || player_one_token =="x"
      player_one_token = "X"
      player_two_token = "O"
    elsif player_one_token =="O" || player_one_token == "o"
      player_one_token = "O"
      player_two_token = "X"
    end

    puts "Begin!"
    puts ""
    puts " 1 | 2 | 3 "
    puts "------------"
    puts " 4 | 5 | 6 "
    puts "------------"
    puts " 7 | 8 | 9 "
    puts ""
    puts "Player 1, where would you like to go?"

    if player_number == "2"
      @game = Game.new(Players::Human.new("#{player_one_token}"), Players::Human.new("#{player_two_token}"))
    elsif player_number == "1"
      @game = Game.new(Players::Human.new("#{player_one_token}"), Players::Computer.new("#{player_two_token}"))
    else
      @game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
    end

    @game.play

    puts "Play again?(y/n)"
    input = gets.strip
    if input == "y"
      load 'bin/tictactoe'
    elsif input == "n"
      puts "Goodbye!"
    end

    end
  end
