# Incorporating the logic below into game.rb caused the game#play tests to break.
class CLItictactoe
  def Replay
    while true # This condition lets the game replay indefinitely
      puts "Play again? y/n"
      play_again = gets.strip.downcase
      while !["y", "n"].include? play_again
        puts "Please enter y or n."
        play_again = gets.strip.downcase
      end
      if play_again == "y"
        start
      else
        puts "Thanks for playing. See you next time."
        exit
      end
    end
  end


def start
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
      if style.to_i == 0
        board = Board.new
        game = Game.new(Players::Computer::AdvancedAI.new('X'), Players::Computer::AdvancedAI.new('O'), board)

      elsif style.to_i == 1
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

      else
        board = Board.new
        game = Game.new(Players::Human.new('X'), Players::Human.new('O'), board)
      end

      puts ""
      puts "Got it! Let's play."
      puts ""
      board.display
      puts ""
      game.play
   end
    Replay()
  end


end
