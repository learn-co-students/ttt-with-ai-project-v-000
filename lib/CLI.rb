class CLI
  def begin
    puts "Welcome to Tic-Tac-Toe!"
    puts "What kind of game would you like to begin?"
    puts "1. Computer vs. Computer"
    puts "2. Player vs. Computer"
    puts "3. Player vs. Player"
    puts "Enter '1', '2', or '3' to make your pick."
    puts "Additionally, activate War Games mode by typing in 'wargames'!"

    choice = gets.chomp

    case choice
    when "1"
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
    when "2"
      puts "Would you like to go first and be 'X'? Enter 'yes' or 'no'."
      answer = gets.chomp.downcase
      if answer == "yes"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
      else
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        game.play
      end
    when "3"
      puts "Player 1, would you like to play as 'X' or 'O'?"
      answer = gets.chomp.downcase
      if answer == "X"
        game = Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        game.play
      else
        game = Game.new(player_1 = Players::Human.new("O"), player_2 = Players::Human.new("X"), board = Board.new)
        game.play
      end
    when "wargames"
      total = 0
      x_score = 0
      o_score = 0
      draw_count = 0
      while total < 100
        game = Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        game.play
        if game.winner == "X"
          x_score += 1
        elsif game.winner == "O"
          o_score += 1
        else
          draw_count += 1
        end
        total += 1
      end
      puts "Over 100 games, 'X' has won #{x_score} times and 'O' has won #{o_score} times!"
      puts "There were #{draw_count} draws."
    else
      puts "Please enter a valid answer!"
      self.begin
    end

    puts "Would you like to start a new game? Enter 'yes' or 'no'."
    play_again = gets.chomp.downcase

    if play_again == "yes"
      self.begin
    else
      puts "Thanks for playing!"
    end
  end
end
