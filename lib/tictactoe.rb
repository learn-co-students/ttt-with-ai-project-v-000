

class TicTacToe
  attr_accessor :board, :game
  def initialize
    @board = Board.new
    @counter = 0
    puts "Welcome to Tic Tac Toe!"
    puts "How many players?"
    players = gets.strip
    initialize if !players..to_i.between?(0,2)
    two_player if players.to_i == 2
    one_player if players.to_i == 1
    zero_player if players.to_i == 0
    wargame if players == "wargame"
  end

  def two_player
    puts "Who should go first and be 'X', 1 or 2"
    x = gets.strip
    if x == "1"
      player_1 = Player::Human.new("X")
      player_2 = Player::Human.new("O")
    elsif x == "2"
      player_1 = Player::Human.new("X")
      player_2 = Player::Human.new("O")
    else
      two_player
    end
    game = Game.new(player_1, player_2, board)
    game.start
    play_again
  end

  def one_player
    puts "Who should go first and be 'X', 1 or 2"
    x = gets.strip
    if x == "1"
      player_1 = Player::Human.new("X")
      player_2 = Player::Computer.new("O")
    elsif x == "2"
      player_1 = Player::Computer.new("X")
      player_2 = Player::Human.new("O")
    else
      one_player
    end
    game = Game.new(player_1, player_2, board)
    game.start
    play_again
  end

  def zero_player
    @counter += 1
    x = 1 + rand(2)
    if x == 1
      player_1 = Player::Computer.new("X")
      player_2 = Player::Computer.new("O")
    elsif x == 2
      player_1 = Player::Computer.new("X")
      player_2 = Player::Computer.new("O")
    end
    game = Game.new(player_1, player_2, board)
    game.start
    y = 1 + rand(2)
    board.reset!
    zero_player if y == 1
    puts "Computer played #{@counter} times"
  end

  def wargame
    100.times do
      x = 1 + rand(2)
      if x == 1
        player_1 = Player::Computer.new("X")
        player_2 = Player::Computer.new("O")
      elsif x == 2
        player_1 = Player::Computer.new("X")
        player_2 = Player::Computer.new("O")
      end
      game = Game.new(player_1, player_2, board)
      game.start
      board.reset!
    end
    puts "NUCLEAR WAR AVERTED!!!"
  end

  def play_again
    puts "Would you like to play again?"
    again = gets.strip
    if again == "yes"
      tic = TicTacToe.new
    else
      puts "Thank you for playing! Hope you have a great day!"
    end
  end

end
