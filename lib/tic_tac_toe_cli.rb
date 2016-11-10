class CLItictactoe
  def initialize
  end

  def call
    puts "Welcome to TicTacToe!"
    puts "Choose 0, 1 or 2 players — or watch a 'wargame'." # "Players" here is meant in the colloquial sense of human players.
    style = gets.strip.downcase
    while !["0", "1", "2", "wargame"].include? style
      puts "Please enter 0, 1, 2 or wargame."
      style = gets.strip.downcase
    end

    if style == "wargame"
      Game.wargame
    else
      if style.to_i == 0 # 0 human players
        board = Board.new
        game = Game.new(Players::Computer::AdvancedAI.new('X'), Players::Computer::AdvancedAI.new('O'), board)
      elsif style.to_i == 1 # 1 human player
        puts "OK! X goes first. Do you want to play X? y/n"
        player_first = gets.strip.downcase
        while !["y", "n"].include? player_first
          puts "Please enter y or n."
          player_first = gets.strip.downcase
        end
        if player_first == "y"
          board = Board.new
          game = Game.new(Players::Human.new('X'), Players::Computer::AdvancedAI.new('O'), board)
        else
          board = Board.new
          game = Game.new(Players::Computer::AdvancedAI.new('X'), Players::Human.new('O'), board)
        end
      else # 2 human players
        board = Board.new
        game = Game.new(Players::Human.new('X'), Players::Human.new('O'), board)
      end

      puts ""
      puts "Got it! Let's play."
      puts ""
      board.display
      puts ""
      play(game)
    end
    Replay()
  end

  def play(game)
    until game.over?
      puts "Player #{game.current_player.token}'s turn:"
      game.turn
    end
    if game.won?
      puts "Congratulations #{game.winner}!"
    elsif game.draw?
      puts "Cats Game!"
    end
  end

  def Replay
    while true
      puts "Play again? y/n"
      play_again = gets.strip.downcase
      while !["y", "n"].include? play_again
        puts "Please enter y or n."
        play_again = gets.strip.downcase
      end
      if play_again == "y"
        call
      else
        puts "Thanks for playing. See you next time."
        exit
      end
    end
  end

end
