class WarGame < Game
  @@won = 0
  @@draw = 0
  @@game_count = 0

  def play
    until over?
      turn
    end
    puts "\n\n"
    self.board.display
    puts "\n\n"
    puts "Congratulations #{self.save_winner}!" if won?
    puts "Cats Game!" if draw?
    @@won += 1 if won?
    @@draw += 1 if draw?
    @@game_count += 1
  end

  def self.count_wins
    @@won
  end

  def self.count_draws
    @@draw
  end

  def self.game_count
    @@game_count
  end

  def self.play_again?
    puts "Would you like to play again? Enter Y to play again or N to exit."
    input = gets.strip.downcase
    case input
      when "y"
        @@won = 0
        @@draw = 0
        @@game_count = 0
        TicTacToe.new
      when "n"
        exit
      else
        play_again?
    end
  end

end
