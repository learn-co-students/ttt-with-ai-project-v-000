class CLITicTacToe

  def call
    puts "Welcome to Tic-Tac-Toe!"
    Game.play_a_new_game
    again = Game.another_game
    if /(?i)yes/ === again
      until /(?i)no/ === again do
        Game.play_a_new_game
        again = Game.another_game
      end
    else
      puts "Thanks for playing."
    end
  end

end
