class TTT_Methods
 
  def self.players
    puts "Please enter the number of players"
    puts "1 - Human vs Computer"
    puts "2 - Human vs Human"
    puts "0 - Computer vs Computer"
    @players = gets.strip
  end

  def self.start
    case @players
    when "0"
      game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"), board = Board.new)
      game.board.display
      game.play
      play_again?
    when "1"
      puts "Please choose your token: X or O."
      human_token = gets.strip.upcase
      human_token == "X" ? computer_token = "O" : computer_token = "X"
      game = Game.new(player_1 = Player::Human.new(human_token), player_2 = Player::Computer.new(computer_token), board = Board.new)
      game.board.display
      game.play
      play_again?
    when "2"
      puts "Player 1, please choose your token: X or O."
      p1_token = gets.strip.upcase
      p1_token == "X" ? p2_token = "O" : p2_token = "X"
      puts "Player 2, your token is #{p2_token}."
      game = Game.new(player_1 = Player::Human.new(p1_token), player_2 = Player::Human.new(p2_token), board = Board.new)
      game.board.display
      game.play
      play_again?
      end
  end

  def self.play_again?
    puts "Do you want to play again? (yes/no)"
    answer = gets.strip.downcase
    if answer == "yes"
      players
      start
    else
      puts "Thanks for playing!"
      exit
    end
  end

end