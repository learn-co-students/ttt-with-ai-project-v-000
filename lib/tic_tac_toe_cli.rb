class TicTacToeCLI
  def initialize
  end

  def call
    play_again = true
    puts "Welcome to Tic Tac Toe!"
    self.start
  end

  def play_again?(input)
    if input == 'y'.downcase
      self.start
    elsif input == 'n'.downcase
      puts "Goodbye!"
    else
      puts "Invalid input.\nPlay again? Y/N"
      self.play_again?(gets.chomp)
    end
  end

  def start
    game = Game.new
    puts "What kind of game would you like to play? \n1. One player \n2. Two Player \n3. Zero Player"
    i = gets.chomp
    case i
    when "1"
      puts "Who should go first? \n1. Human \n2. Computer"
      j = gets.chomp
      if j == "1"
        puts "OK! You will go first"
        puts "#{game.current_player.token}'s turn"
        game.player_2 = Players::Computer.new("O")
      elsif j == "2"
        puts "OK! The computer will go first."
        puts "#{game.current_player.token}'s turn"
        game.player_1 = Players::Computer.new("X")
      else
        puts "That is not a valid input."
        game.start
      end
      game.board.first_display
      game.play
    when "2"
      puts "OK! \'X\' goes first."
      game.board.first_display
      game.play
    when "3"
      puts "OK! The computer will play itself."
      game.board.display
      game.player_1 = Players::Computer.new("X")
      game.player_2 = Players::Computer.new("O")
      game.play
    when "wargames"
      puts "WARGAMES"
      game.board.display
      game.player_1 = Players::Computer.new("X")
      game.player_2 = Players::Computer.new("O")
      100.times do
        game.board.reset!
        game.play
      end
      puts "WARGAMES REPORT:"
      puts "X won #{game.player_1.win_count} times."
      puts "O won #{game.player_2.win_count} times."
      puts "There were #{Game.draw_count} draws."
      Game.draw_count = 0
    else
      puts "That is not a valid input."
      self.start
    end
    puts "Play again? Y/N"
    self.play_again?(gets.chomp)
  end
end
